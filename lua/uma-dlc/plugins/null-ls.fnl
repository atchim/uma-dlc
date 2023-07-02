(import-macros {: modcall} :soupmacs.soupmacs)

{ 1 :jose-elias-alvarez/null-ls.nvim
  :event [:BufReadPre :BufNewFile]
  :opts
  (fn [_ old-opts]
    (let
      [ nls (require :null-ls)
        new-opts
        { :root_dir
          (modcall
            :null-ls.utils
            :root_pattern
            [:.null-ls-root :.neoconf.json :Makefile :.git])
          :sources [nls.builtins.code_actions.gitrebase]}]
      (vim.tbl_deep_extend :force old-opts new-opts)))
  :dependencies :nvim-lua/plenary.nvim}