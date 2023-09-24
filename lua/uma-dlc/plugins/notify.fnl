(import-macros {: modcall} :soupmacs.soupmacs)

(fn config [_ opts]
  (modcall :notify :setup opts)
  (let [old-c-l (vim.fn.maparg :<C-L> :n)]
    (vim.keymap.set
      :n
      :<C-L>
      (.. old-c-l "<Cmd>lua require'notify'.dismiss()<CR>"))))

{ 1 :rcarriga/nvim-notify
  :event :VeryLazy
  :opts {:stages :fade}
  : config
  :dependencies :atchim/sopa.nvim}