(import-macros {: modcall} :soupmacs.soupmacs)

{ 1 :echasnovski/mini.comment
  :event :BufRead
  :opts
  { :hooks
    { :pre
      #(modcall :ts_context_commentstring.internal :update_commentstring [])}
    :options {:pad_comment_parts false}}
  :config (fn [_ opts] (modcall :mini.comment :setup opts))
  :dependencies :JoosepAlviste/nvim-ts-context-commentstring}