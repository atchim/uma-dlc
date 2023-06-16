(import-macros {: modcall} :soupmacs.soupmacs)
{ 1 :ggandor/leap.nvim
  :event :BufRead
  :config #(modcall :leap :set_default_keymaps [])}