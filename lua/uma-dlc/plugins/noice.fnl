(fn opts [_ old-opts]
  (let
    [ x (require :sopa.palette)
      custom_groups
      { :NoiceCmdlinePopup {:bg (x 2) :bold true}
        :NoiceCmdlinePopupBorder {:bg (x 2) :fg (x 1)}
        :NoiceCmdlinePopupBorderSearch {:link :NoiceCmdlinePopupBorder}}
      new-opts {: custom_groups}]
    (vim.tbl_deep_extend :force old-opts new-opts)))

{ 1 :folke/noice.nvim
  :event :VeryLazy
  :opts
  { :cmdline
    { :format
      { :cmdline {:title ""}
        :filter {:title ""}
        :help {:title ""}
        :lua {:title ""}
        :search_down {:title ""}
        :search_up {:title ""}}}
    :lsp
    { :override
      [ :vim.lsp.util.convert_input_to_markdown_lines true
        :vim.lsp.util.stylize_markdown true]}
    :presets {:long_message_to_split true}
    :views {:cmdline_popup {:border {:style [" " " " " " " " :▓ :▓ :▓ " "]}}}}
  :dependencies
  [ {1 :atchim/sopa.nvim : opts}
    :MunifTanjim/nui.nvim
    { 1 :nvim-treesitter/nvim-treesitter
      :opts
      {:ensure_installed [:bash :lua :markdown :markdown_inline :regex :vim]}}
    :rcarriga/nvim-notify]}