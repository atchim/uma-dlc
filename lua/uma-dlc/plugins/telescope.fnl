(import-macros {:modcall mc} :soupmacs.soupmacs)

{ 1 :nvim-telescope/telescope.nvim
  :cmd :Telescope
  :keys
  [ {1 :<Leader>fb 2 #(mc :telescope.builtin :buffers []) :desc :Buffers}
    {1 :<Leader>ff 2 #(mc :telescope.builtin :find_files []) :desc :Files}
    {1 :<Leader>fg 2 #(mc :telescope.builtin :live_grep []) :desc "Live grep"}
    {1 :<Leader>fh 2 #(mc :telescope.builtin :help_tags []) :desc "Help tags"}
    {1 :<Leader>fo 2 #(mc :telescope.builtin :oldfiles []) :desc "Old files"}]
  :config #(do (mc :telescope :setup []) (mc :telescope :load_extension :fzf))
  :dependencies
  [ :nvim-lua/plenary.nvim
    {1 :nvim-telescope/telescope-fzf-native.nvim :build :make}]}