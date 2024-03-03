local function _1_()
  local nls = require("null-ls")
  local builtins = nls.builtins
  return {sources = {builtins.formatting.prettierd}}
end
return {"nvimtools/none-ls.nvim", event = {"BufNew", "BufNewFile", "BufReadPre"}, opts = _1_, dependencies = "nvim-lua/plenary.nvim"}
