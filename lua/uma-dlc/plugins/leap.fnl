(import-macros {: modcall} :soupmacs.soupmacs)
{ 1 :ggandor/leap.nvim
  :event [:BufNew :BufNewFile :BufReadPre]
  :config #(modcall :leap :set_default_keymaps [])}