{ 1 :folke/which-key.nvim
  :event :UIEnter
  :config
  (fn [_ opts]
    (set vim.opt.timeoutlen 500)
    (let [{: register : setup} (require :which-key)]
      (setup opts)
      ; Registers groups.
      (register
        { :<Space> {:name :Neo-Tree}
          :c {:name :Quickfix}
          :f {:name :Find}
          :l {:name :LSP}
          :t {:name :Toggle}}
        {:prefix :<Leader>})))}