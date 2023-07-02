local function set_mapleader_21()
  vim.keymap.set("n", "<Space>", "<NOP>")
  vim.g.mapleader = " "
  return nil
end
local function setup()
  set_mapleader_21()
  local mods = {"options", "globals", "autocommands", "commands", "key-mappings", "diagnostics", "lsp", "lazy"}
  for _, mod in ipairs(mods) do
    do end (require(("uma-dlc.core." .. mod))).setup()
  end
  return nil
end
return {setup = setup}
