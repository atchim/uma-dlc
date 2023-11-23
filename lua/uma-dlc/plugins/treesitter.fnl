(import-macros {: modcall} :soupmacs.soupmacs)

(local opts
  { :highlight {:enable true}
    :incremental_selection
    { :enable true
      :keymaps
      { :init_selection :gn
        :node_decremental :N
        :node_incremental :n
        :scope_incremental :s}}
    :indent {:enable true}
    :textobjects
    { :move
      { :enable true
        :set_jumps true
        :goto_next_start
        {"]m" "@function.outer" "]]" "@class.outer"}
        :goto_previous_start {"[m" "@function.outer" "[[" "@class.outer"}
        :goto_next_end {"]M" "@function.outer" "][" "@class.outer"}
        :goto_previous_end {"[M" "@function.outer" "[]" "@class.outer"}}
    :select
    { :enable true
      :lookahead true
      :keymaps
      { :ac "@class.outer"
        :ic "@class.inner"
        :af "@function.outer"
        :if "@function.inner"
        :n "@named-node"
        :N "@node"}}
    :swap
    { :enable true
      :swap_next {:<C-N> "@swappable"}
      :swap_previous {:<C-P> "@swappable"}}}})

(fn config [_ opts]
  (modcall :nvim-treesitter.configs :setup opts)
  (let [o vim.opt]
    (set o.foldexpr "nvim_treesitter#foldexpr()")
    (set o.foldmethod :expr)))

[ { 1 :JoosepAlviste/nvim-ts-context-commentstring
    :event [:BufNew :BufNewFile :BufReadPre]
    :opts (fn [] (set vim.g.skip_ts_context_commentstring_module true) {})
    :dependencies :nvim-treesitter/nvim-treesitter}
  { 1 :nvim-treesitter/nvim-treesitter
    :cmd
    [ :TSInstall
      :TSInstallSync
      :TSInstallInfo
      :TSUpdate
      :TSUpdateSync
      :TSUninstall
      :TSModuleInfo
      :TSEditQuery
      :TSEditQueryUserAfter]
    :event [:BufNew :BufNewFile :BufReadPre]
    : opts
    : config}
  { 1 :nvim-treesitter/nvim-treesitter-textobjects
    :event [:BufNew :BufNewFile :BufReadPre]
    :dependencies :nvim-treesitter/nvim-treesitter}
  { 1 :nvim-treesitter/playground
    :event [:BufNew :BufNewFile :BufReadPre]
    :keys
    [ { 1 :<Leader>tp
        2 :<Cmd>TSPlaygroundToggle<CR>
        :desc "Tree-Sitter Playground"}]
    :dependencies :nvim-treesitter/nvim-treesitter}]