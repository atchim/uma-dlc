local function on_attach(bufnr)
  local gs = require("gitsigns")
  local function map_21(mode, lhs, rhs, _3fopts)
    local opts = (_3fopts or {})
    opts.buffer = bufnr
    return vim.keymap.set(mode, lhs, rhs, opts)
  end
  local function _1_()
    if vim.wo.diff then
      return "[c"
    else
      local function _2_()
        return gs.prev_hunk()
      end
      vim.schedule(_2_)
      return "<Ignore>"
    end
  end
  map_21("n", "[c", _1_, {expr = true, desc = "Hunk go to previous"})
  local function _4_()
    if vim.wo.diff then
      return "]c"
    else
      local function _5_()
        return gs.next_hunk()
      end
      vim.schedule(_5_)
      return "<Ignore>"
    end
  end
  map_21("n", "]c", _4_, {expr = true, desc = "Hunk go to next"})
  local function _7_()
    return gs.blame_line({full = true})
  end
  map_21("n", "<Leader>gb", _7_, {desc = "Blame in line"})
  map_21("n", "<Leader>gd", gs.diffthis, {desc = "Diff this"})
  local function _8_()
    return gs.diffthis("~")
  end
  map_21("n", "<Leader>gD", _8_, {desc = "Diff this ~"})
  map_21("n", "<Leader>gp", gs.preview_hunk, {desc = "Hunk preview"})
  map_21("n", "<Leader>gr", gs.reset_hunk, {desc = "Hunk reset"})
  local function _9_()
    return gs.reset_hunk({vim.fn.line("."), vim.fn.line("v")})
  end
  map_21("v", "<Leader>gr", _9_, {desc = "Hunk reset"})
  map_21("n", "<Leader>gR", gs.reset_buffer, {desc = "Hunk buffer reset"})
  map_21("n", "<Leader>gs", gs.stage_hunk, {desc = "Hunk stage"})
  local function _10_()
    return gs.stage_hunk({vim.fn.line("."), vim.fn.line("v")})
  end
  map_21("v", "<Leader>gs", _10_, {desc = "Hunk stage"})
  map_21("n", "<Leader>gS", gs.stage_buffer, {desc = "Hunk buffer stage"})
  map_21("n", "<Leader>gu", gs.undo_stage_hunk, {desc = "Hunk stage undo"})
  map_21("n", "<Leader>tb", gs.toggle_current_line_blame, {desc = "Blame in line"})
  map_21("n", "<Leader>td", gs.toggle_deleted, {desc = "Hunk deleted"})
  return map_21({"o", "x"}, "ih", "<Cmd><C-U>Gitsigns select_hunk<CR>", {desc = "Hunk"})
end
return {"lewis6991/gitsigns.nvim", event = {"BufNewFile", "BufReadPre"}, opts = {on_attach = on_attach}, dependencies = "atchim/sopa.nvim"}
