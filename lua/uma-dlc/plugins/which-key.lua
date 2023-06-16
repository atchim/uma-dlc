local function _1_(_, opts)
  vim.opt.timeoutlen = 500
  local _let_2_ = require("which-key")
  local register = _let_2_["register"]
  local setup = _let_2_["setup"]
  setup(opts)
  return register({["<Space>"] = {name = "Neo-Tree"}, c = {name = "Quickfix"}, f = {name = "Find"}, l = {name = "LSP"}, t = {name = "Toggle"}}, {prefix = "<Leader>"})
end
return {"folke/which-key.nvim", event = "UIEnter", config = _1_}
