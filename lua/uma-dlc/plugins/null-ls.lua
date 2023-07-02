local function _1_(_, old_opts)
  local nls = require("null-ls")
  local new_opts = {root_dir = (require("null-ls.utils")).root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"), sources = {nls.builtins.code_actions.gitrebase}}
  return vim.tbl_deep_extend("force", old_opts, new_opts)
end
return {"jose-elias-alvarez/null-ls.nvim", event = {"BufReadPre", "BufNewFile"}, opts = _1_, dependencies = "nvim-lua/plenary.nvim"}
