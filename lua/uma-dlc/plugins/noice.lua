local function opts(_, old_opts)
  local x = require("sopa.palette")
  local custom_groups = {NoiceCmdlinePopup = {bg = x(2), bold = true}, NoiceCmdlinePopupBorder = {bg = x(2), fg = x(1)}, NoiceCmdlinePopupBorderSearch = {link = "NoiceCmdlinePopupBorder"}}
  local new_opts = {custom_groups = custom_groups}
  return vim.tbl_deep_extend("force", old_opts, new_opts)
end
return {"folke/noice.nvim", event = "VeryLazy", opts = {cmdline = {format = {cmdline = {title = ""}, filter = {title = ""}, help = {title = ""}, lua = {title = ""}, search_down = {title = ""}, search_up = {title = ""}}}, lsp = {override = {"vim.lsp.util.convert_input_to_markdown_lines", true, "vim.lsp.util.stylize_markdown", true}}, presets = {long_message_to_split = true}, views = {cmdline_popup = {border = {style = {" ", " ", " ", " ", "\226\150\147", "\226\150\147", "\226\150\147", " "}}}}}, dependencies = {{"atchim/sopa.nvim", opts = opts}, "MunifTanjim/nui.nvim", {"nvim-treesitter/nvim-treesitter", opts = {ensure_installed = {"bash", "lua", "markdown", "markdown_inline", "regex", "vim"}}}, "rcarriga/nvim-notify"}}
