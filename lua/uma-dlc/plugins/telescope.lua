local function _1_()
  return (require("telescope.builtin")).buffers()
end
local function _2_()
  return (require("telescope.builtin")).find_files()
end
local function _3_()
  return (require("telescope.builtin")).live_grep()
end
local function _4_()
  return (require("telescope.builtin")).help_tags()
end
local function _5_()
  return (require("telescope.builtin")).oldfiles()
end
local function _6_()
  do end (require("telescope")).setup()
  return (require("telescope")).load_extension("fzf")
end
return {"nvim-telescope/telescope.nvim", cmd = "Telescope", keys = {{"<Leader>fb", _1_, desc = "Buffers"}, {"<Leader>ff", _2_, desc = "Files"}, {"<Leader>fg", _3_, desc = "Live grep"}, {"<Leader>fh", _4_, desc = "Help tags"}, {"<Leader>fo", _5_, desc = "Old files"}}, config = _6_, dependencies = {"nvim-lua/plenary.nvim", {"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}}
