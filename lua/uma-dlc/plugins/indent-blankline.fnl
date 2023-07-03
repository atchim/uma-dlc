{ 1 :lukas-reineke/indent-blankline.nvim
  :event [:BufNew :BufNewFile :BufReadPre]
  :keys
  [{1 :<Leader>ti 2 :<Cmd>IndentBlanklineToggle<CR> :desc "Indent Blankline"}]
  :opts
  {:enabled false :show_current_context true :show_current_context_start true}}