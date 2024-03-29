local opts = {highlight = {enable = true}, incremental_selection = {enable = true, keymaps = {init_selection = "gn", node_decremental = "N", node_incremental = "n", scope_incremental = "s"}}, indent = {enable = true}, textobjects = {move = {enable = true, set_jumps = true, goto_next_start = {["]m"] = "@function.outer", ["]]"] = "@class.outer"}, goto_previous_start = {["[m"] = "@function.outer", ["[["] = "@class.outer"}, goto_next_end = {["]M"] = "@function.outer", ["]["] = "@class.outer"}, goto_previous_end = {["[M"] = "@function.outer", ["[]"] = "@class.outer"}}, select = {enable = true, lookahead = true, keymaps = {ac = "@class.outer", ic = "@class.inner", af = "@function.outer", ["if"] = "@function.inner", n = "@named-node", N = "@node"}}, swap = {enable = true, swap_next = {["<C-N>"] = "@swappable"}, swap_previous = {["<C-P>"] = "@swappable"}}}}
local function config(_, opts0)
  do end (require("nvim-treesitter.configs")).setup(opts0)
  local o = vim.opt
  o.foldexpr = "nvim_treesitter#foldexpr()"
  o.foldmethod = "expr"
  return nil
end
local function _1_()
  vim.g.skip_ts_context_commentstring_module = true
  return {}
end
return {{"JoosepAlviste/nvim-ts-context-commentstring", event = {"BufNew", "BufNewFile", "BufReadPre"}, opts = _1_, dependencies = "nvim-treesitter/nvim-treesitter"}, {"nvim-treesitter/nvim-treesitter", cmd = {"TSInstall", "TSInstallSync", "TSInstallInfo", "TSUpdate", "TSUpdateSync", "TSUninstall", "TSModuleInfo", "TSEditQuery", "TSEditQueryUserAfter"}, event = {"BufNew", "BufNewFile", "BufReadPre"}, opts = opts, config = config}, {"nvim-treesitter/nvim-treesitter-textobjects", event = {"BufNew", "BufNewFile", "BufReadPre"}, dependencies = "nvim-treesitter/nvim-treesitter"}, {"nvim-treesitter/playground", event = {"BufNew", "BufNewFile", "BufReadPre"}, keys = {{"<Leader>tp", "<Cmd>TSPlaygroundToggle<CR>", desc = "Tree-Sitter Playground"}}, dependencies = "nvim-treesitter/nvim-treesitter"}}
