{ 1 :lukas-reineke/indent-blankline.nvim
  :name :ibl
  :event [:BufNew :BufNewFile :BufReadPre]
  :keys
  [{1 :<Leader>ti 2 :<Cmd>IBLToggle<CR> :desc "Indent Blankline"}]
  :opts
  {:enabled false :show_current_context true :show_current_context_start true}}