(import-macros {: modcall} :soupmacs.soupmacs)

(fn config []
  (local cmp (require :cmp))
  (local luasnip (require :luasnip))
  (local icons
    { :Class :
      :Color :
      :Constant :
      :Constructor :
      :Enum :
      :EnumMember :
      :Event :
      :Field :ﰠ
      :File :
      :Folder :
      :Function :
      :Interface :
      :Keyword :
      :Method :
      :Module :
      :Operator :
      :Property :
      :Reference :
      :Snippet :
      :Struct :פּ
      :Text :
      :TypeParameter :
      :Unit :
      :Value :
      :Variable :})

  (cmp.setup
    { :formatting
      { :fields [:kind :abbr]
        :format
        (fn [_ vimitem] (set vimitem.kind (. icons vimitem.kind)) vimitem)}
      :mapping
      { :<C-C> (cmp.mapping.abort)
        :<C-E> (cmp.mapping (cmp.mapping.scroll_docs 1) [:i :c])
        :<C-N> (cmp.mapping.select_next_item)
        :<C-P> (cmp.mapping.select_prev_item)
        :<C-Y> (cmp.mapping (cmp.mapping.scroll_docs -1) [:i :c])
        :<CR> (cmp.mapping.confirm {:select true})
        :<Down> (cmp.mapping.select_next_item)
        :<S-Tab>
        (cmp.mapping
          (fn [fallback]
            (if
              (cmp.visible) (cmp.select_prev_item)
              (luasnip.jumpable -1) (luasnip.jump -1)
              (fallback)))
          [:i :s])
        :<Tab>
        (cmp.mapping
          (fn [fallback]
            (fn has-word-before []
              "Returns if there is a non-space character before the cursor."
              (let [(line col) (unpack (vim.api.nvim_win_get_cursor 0))]
                (and
                  (not= col 0)
                  (=
                    (->
                      (vim.api.nvim_buf_get_lines 0 (- line 1) line true)
                      (. 1)
                      (: :sub col col)
                      (: :match "%s"))
                    nil))))

            (if
              (cmp.visible) (cmp.select_next_item)
              (luasnip.expandable) (luasnip.expand)
              (luasnip.expand_or_jumpable) (luasnip.expand_or_jump)
              (has-word-before) (cmp.complete)
              (fallback)))
          [:i :s])
        :<Up> (cmp.mapping.select_prev_item)}
      :snippet {:expand (fn [args] (modcall :luasnip :lsp_expand args.body))}
      :sources
      (cmp.config.sources
        [{:name :nvim_lsp} {:name :luasnip} {:name :buffer} {:name :path}])
      :view {:entries {:name :custom :selection_order :near_cursor}}}))

{ 1 :hrsh7th/nvim-cmp
  :event :InsertEnter
  : config
  :dependencies
  [ :hrsh7th/cmp-buffer
    :hrsh7th/cmp-nvim-lsp
    :hrsh7th/cmp-path
    { 1 :saadparwaiz1/cmp_luasnip
      :dependencies
      { 1 :L3MON4D3/LuaSnip
        :config #(modcall :luasnip.loaders.from_vscode :lazy_load [])
        :dependencies :rafamadriz/friendly-snippets}}]}