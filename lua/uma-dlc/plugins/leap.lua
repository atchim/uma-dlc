local function _1_()
  return (require("leap")).set_default_keymaps()
end
return {"ggandor/leap.nvim", event = "BufRead", config = _1_}
