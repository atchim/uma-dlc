(import-macros {: modcall} :soupmacs.soupmacs)

(fn config []
  (fn on_attach [client bufnr]
    (let
      [ api vim.api
        group
        (api.nvim_create_augroup (.. :uma-dlc.lspconfig.on_attach. bufnr) {})
        ns-name (.. :vim.lsp. client.name :. bufnr)
        diagn vim.diagnostic
        ns
        (do
          (var found false)
          (var ns nil)
          (each [i data (pairs (diagn.get_namespaces)) &until found]
            (set ns i)
            (set found (= ns-name data.name)))
          ns)
        map vim.keymap.set
        mapn (fn [lhs rhs desc] (map :n lhs rhs {:buffer bufnr : desc}))]

      (when (client.supports_method :textDocument/formatting)
        (api.nvim_create_autocmd
          :BufWritePre
          { :desc "Auto format on write"
            : group
            :callback
            #(let [autofmt vim.b.uma_dlc_lspconfig_autofmt]
              (when (or (= nil autofmt) autofmt)
                (vim.lsp.buf.format {: bufnr})))
            :buffer bufnr})
        (mapn
          :<Leader>tf
          #(let
            [ b (-> vim.b (. bufnr))
              autofmt b.uma_dlc_lspconfig_autofmt
              value (not (or (= nil autofmt) autofmt))
              action (if value :enabled :disabled)
              msg (.. action " LSP auto format on write")]
            (set b.uma_dlc_lspconfig_autofmt value)
            (vim.notify msg vim.log.levels.INFO))
          "Local auto format on write"))

      (var old-vt (. (diagn.config) :virtual_text))
      (mapn
        :<Leader>tv
        #(let
          [ ns-config (diagn.config nil ns)
            vt ns-config.virtual_text
            vt (if (= nil vt) old-vt vt)]
          (set ns-config.virtual_text
            (if vt (do (set old-vt vt) false) old-vt))
          (diagn.config ns-config ns))
        "Virtual text")

      (map
        :v
        :<Leader>lf
        #(vim.lsp.buf.format)
        {:buffer bufnr :desc :Format})))

  (let
    [ api vim.api
      capabilities
      (modcall
        :cmp_nvim_lsp
        :default_capabilities
        (vim.lsp.protocol.make_client_capabilities))]
    (modcall
      :mason-lspconfig
      :setup_handlers
      { 1
        (fn [server]
          (modcall :lspconfig server :setup {: capabilities : on_attach}))
        :fennel_language_server
        #(modcall
          :lspconfig
          :fennel_language_server
          :setup
          { : capabilities
            : on_attach
            :settings
            { :fennel
              { :diagnostics {:globals [:vim]}
                :workspace {:library (api.nvim_list_runtime_paths)}}}})
        :lua_ls
        #(modcall
          :lspconfig
          :lua_ls
          :setup
          { : capabilities
            : on_attach
            :settings
            { :Lua
              { :diagnostics {:globals [:vim]}
                :workspace
                { :library (api.nvim_get_runtime_file "" true)
                  :checkThirdParty false}}}})})))

[ {1 :j-hui/fidget.nvim :event :LspAttach :opts {:text {:spinner :dots}}}
  { 1 :neovim/nvim-lspconfig
    :event [:BufNewFile :BufReadPre]
    : config
    :dependencies
    { 1 :williamboman/mason-lspconfig.nvim
      :config true
      :dependencies
      { 1 :williamboman/mason.nvim
        :build :<Cmd>MasonUpdate
        :cmd
        [:Mason :MasonInstall :MasonUninstall :MasonUninstallAll :MasonLog]
        :opts {}}}}]