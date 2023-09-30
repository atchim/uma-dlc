{ 1 :nvimtools/none-ls.nvim
  :event [:BufNew :BufNewFile :BufReadPre]
  :opts
  (fn []
    (let [nls (require :null-ls) builtins nls.builtins]
      { :sources
        [builtins.code_actions.eslint_d builtins.formatting.prettierd]}))
  :dependencies :nvim-lua/plenary.nvim}