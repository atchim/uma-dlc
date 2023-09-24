local function config(_, opts)
  do end (require("notify")).setup(opts)
  local old_c_l = vim.fn.maparg("<C-L>", "n")
  return vim.keymap.set("n", "<C-L>", (old_c_l .. "<Cmd>lua require'notify'.dismiss()<CR>"))
end
return {"rcarriga/nvim-notify", event = "VeryLazy", opts = {stages = "fade"}, config = config, dependencies = "atchim/sopa.nvim"}
