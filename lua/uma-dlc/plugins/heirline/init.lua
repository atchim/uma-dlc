local function fetch_colors_21()
  local _let_1_ = require("heirline.utils")
  local hl = _let_1_["get_highlight"]
  local comment_2a = hl("Comment")
  local constant = hl("Constant")
  local error = hl("DiagnosticError")
  local hint = hl("DiagnosticHint")
  local identifier = hl("Identifier")
  local info = hl("DiagnosticInfo")
  local normal = hl("Normal")
  local search = hl("Search")
  local special = hl("Special")
  local statement = hl("Statement")
  local statusline = hl("StatusLine")
  local string = hl("String")
  local tabline = hl("TabLine")
  local tablinesel = hl("TabLineSel")
  local type = hl("Type")
  local warn = hl("DiagnosticWarn")
  local winbar_2a = hl("WinBar")
  local winbarnc = hl("WinBarNC")
  return {n = normal.fg, no = comment_2a.fg, nov = comment_2a.fg, noV = comment_2a.fg, ["no\22"] = comment_2a.fg, niI = normal.fg, niR = normal.fg, niV = normal.fg, nt = normal.fg, ntT = normal.fg, v = search.fg, vs = search.fg, V = search.fg, Vs = search.fg, ["\22"] = search.fg, ["\22s"] = search.fg, s = hint.fg, S = hint.fg, ["\19"] = hint.fg, i = string.fg, ic = string.fg, ix = string.fg, R = special.fg, Rc = special.fg, Rx = special.fg, Rv = special.fg, Rvc = special.fg, Rvx = special.fg, c = statement.fg, cv = error.fg, r = identifier.fg, rm = identifier.fg, ["r?"] = identifier.fg, ["!"] = error.fg, t = type.fg, buflocked = error.fg, bufmod = hint.fg, diagnerr = error.fg, diagnwarn = warn.fg, diagninfo = info.fg, diagnhint = hint.fg, filecn = constant.fg, fileenc = special.fg, filefmt = string.fg, fileln = warn.fg, githead = type.fg, scroll = error.fg, statuslinebg = statusline.bg, statuslinefg = statusline.fg, tablinebg = tabline.bg, tablinefg = tabline.fg, tablineselbg = tablinesel.bg, tablineselfg = tablinesel.fg, termcmd = type.fg, termcwd = special.fg, termpid = identifier.fg, winbarbg = winbar_2a.bg, winbarfg = winbar_2a.fg, winbarncbg = winbarnc.bg, winbarncfg = winbarnc.fg}
end
local function config()
  local function setup_statuslines()
    local api = vim.api
    local devicons = require("nvim-web-devicons")
    local heirline_conditions = require("heirline.conditions")
    local heirline_utils = require("heirline.utils")
    local L_2a_normal, L_2a_comment, L_2a_linenr = nil, nil, nil
    do
      local convert = require("ccc.utils.convert")
      local _let_2_ = require("ccc.utils.parse")
      local hex = _let_2_["hex"]
      local _let_3_ = require("ccc.output.hex")
      local str = _let_3_["str"]
      local hex__3ergb
      local function _4_(hexcolor)
        local _, _0, r, g, b = hexcolor:find("^#(%x%x)(%x%x)(%x%x)$")
        local rgb = {r, g, b}
        local rgb0
        do
          local tbl_17_auto = {}
          local i_18_auto = #tbl_17_auto
          for _1, c in ipairs(rgb) do
            local val_19_auto = hex(c)
            if (nil ~= val_19_auto) then
              i_18_auto = (i_18_auto + 1)
              do end (tbl_17_auto)[i_18_auto] = val_19_auto
            else
            end
          end
          rgb0 = tbl_17_auto
        end
        return rgb0
      end
      hex__3ergb = _4_
      local L_2a
      local function _6_(L_2a0, hexcolor)
        local rgb = hex__3ergb(hexcolor)
        local lab = convert.rgb2lab(rgb)
        local lab0 = {L_2a0, unpack(lab, 2)}
        local rgb0 = convert.lab2rgb(lab0)
        local hex0 = str(rgb0)
        return hex0
      end
      L_2a = _6_
      local hl = heirline_utils.get_highlight
      local hl_L_2a
      local function _7_(group)
        return (convert.rgb2lab(hex__3ergb(("#%x"):format(hl(group).fg))))[1]
      end
      hl_L_2a = _7_
      local L_2a_normal0 = hl_L_2a("Normal")
      local L_2a_comment0 = hl_L_2a("Comment")
      local L_2a_linenr0 = hl_L_2a("LineNr")
      local function _8_(...)
        return L_2a(L_2a_normal0, ...)
      end
      local function _9_(...)
        return L_2a(L_2a_comment0, ...)
      end
      local function _10_(...)
        return L_2a(L_2a_linenr0, ...)
      end
      L_2a_normal, L_2a_comment, L_2a_linenr = _8_, _9_, _10_
    end
    local space = {provider = " "}
    local function _11_(self_3_auto)
      return {fg = self_3_auto.mode, reverse = true}
    end
    local function _12_(self_3_auto)
      self_3_auto.mode = vim.fn.mode(1)
      if not self_3_auto["init?"] then
        do
          local group_4_auto = api.nvim_create_augroup("uma-dlc.heirline.statusln_init", {})
          api.nvim_create_autocmd("ModeChanged", {command = "redrawstatus", group = group_4_auto, pattern = "*:*o"})
        end
        self_3_auto["init?"] = true
        return nil
      else
        return nil
      end
    end
    local function _14_(self_3_auto)
      local function _15_()
        local t_16_ = self_3_auto.aliases
        if (nil ~= t_16_) then
          t_16_ = (t_16_)[self_3_auto.mode]
        else
        end
        return t_16_
      end
      return (" \238\152\171 %-4.4(" .. (_15_() or self_3_auto.mode) .. "%) \226\150\146")
    end
    local _18_
    do
      local proto_5_auto
      local function _19_(self_6_auto)
        local head_7_auto = (vim.b.gitsigns_head or vim.g.gitsigns_head)
        if head_7_auto then
          self_6_auto.head = head_7_auto
          return true
        else
          return nil
        end
      end
      proto_5_auto = {condition = _19_}
      local head_7_auto
      local function _21_(self_6_auto)
        return (" \239\144\152 " .. self_6_auto.head .. " \226\150\146")
      end
      head_7_auto = {hl = {fg = "githead", reverse = true}, provider = _21_}
      local _let_22_ = heirline_utils
      local insert_8_auto = _let_22_["insert"]
      _18_ = insert_8_auto(proto_5_auto, head_7_auto, space)
    end
    local _23_
    do
      local _let_24_ = heirline_conditions
      local w_25_3c_3f_38_auto = _let_24_["width_percent_below"]
      local _let_25_ = heirline_utils
      local clone_39_auto = _let_25_["clone"]
      local insert_40_auto = _let_25_["insert"]
      local proto_41_auto
      local function _26_(self_42_auto)
        local bufty_43_auto = vim.bo.buftype
        local ft_44_auto
        if (bufty_43_auto == term_45_auto) then
          ft_44_auto = term_45_auto
        else
          ft_44_auto = vim.bo.filetype
        end
        local locked_3f_46_auto
        do
          local bo_47_auto = vim.bo[0]
          locked_3f_46_auto = (not bo_47_auto.modifiable or bo_47_auto.readonly)
        end
        local mod_3f_48_auto = vim.bo.modified
        local term_45_auto = "terminal"
        local _let_28_ = devicons
        local icon_color_by_ft_49_auto = _let_28_["get_icon_color_by_filetype"]
        local icon_50_auto, color_51_auto = icon_color_by_ft_49_auto(ft_44_auto, {default = true})
        local active_3f_52_auto = nil
        local name_54_auto = api.nvim_buf_get_name(0)
        self_42_auto["locked?"] = locked_3f_46_auto
        self_42_auto["mod?"] = mod_3f_48_auto
        self_42_auto.bufty = bufty_43_auto
        self_42_auto.icon = icon_50_auto
        self_42_auto["icon-color"] = L_2a_normal(color_51_auto)
        self_42_auto.name = name_54_auto
        return nil
      end
      proto_41_auto = {init = _26_}
      local flags_56_auto
      local _29_
      do
        local locked_57_auto
        local function _30_(self_42_auto)
          return self_42_auto["locked?"]
        end
        locked_57_auto = {condition = _30_, hl = {fg = "buflocked", reverse = true}, provider = " \239\128\163"}
        local mod_60_auto
        local function _31_(self_42_auto)
          return self_42_auto["mod?"]
        end
        mod_60_auto = {condition = _31_, hl = {fg = "bufmod", reverse = true}, provider = "\226\158\149"}
        local function _32_(self_42_auto)
          return self_42_auto["mod?"]
        end
        local function _33_(self_42_auto)
          if self_42_auto["locked?"] then
            return {bg = "buflocked", fg = "bufmod"}
          else
            return {bg = "bufmod"}
          end
        end
        local function _35_(self_42_auto)
          if self_42_auto["locked?"] then
            return "\226\150\146"
          else
            return " "
          end
        end
        _29_ = {locked_57_auto, {condition = _32_, hl = _33_, provider = _35_}, mod_60_auto}
      end
      local function _37_(self_42_auto)
        return (self_42_auto.bufty ~= "terminal")
      end
      flags_56_auto = clone_39_auto(_29_, {condition = _37_})
      local icon_50_auto
      local function _38_(self_42_auto)
        return {fg = self_42_auto["icon-color"], reverse = true}
      end
      local function _39_(self_42_auto)
        return self_42_auto.icon
      end
      icon_50_auto = {hl = _38_, provider = _39_}
      local ty_63_auto
      local _40_
      do
        local _let_41_ = heirline_utils
        local insert_12_auto = _let_41_["insert"]
        local proto_13_auto
        local function _42_(self_14_auto)
          return (self_14_auto.bufty == "terminal")
        end
        local function _43_(self_14_auto)
          local name_15_auto = api.nvim_buf_get_name(0)
          local __16_auto, __16_auto0, cwd_17_auto, pid_18_auto, cmd_19_auto = name_15_auto:find("term://(.+)//(.+):(.+)")
          do
            self_14_auto.cwd = cwd_17_auto
            self_14_auto["showcwd?"] = (vim.fn.expand(cwd_17_auto) ~= vim.fn.getcwd(0, 0))
            self_14_auto.pid = pid_18_auto
          end
          self_14_auto.cmd = cmd_19_auto
          return nil
        end
        proto_13_auto = {condition = _42_, init = _43_}
        local icon_space_21_auto
        local function _44_(self_14_auto)
          return {fg = self_14_auto["icon-color"], reverse = true}
        end
        icon_space_21_auto = {hl = _44_, provider = " "}
        local cmd_19_auto
        local function _45_(self_14_auto)
          return {fg = "termcmd", reverse = true}
        end
        local function _46_(self_14_auto)
          local cmd_19_auto0 = self_14_auto.cmd
          return ("\239\132\160 " .. cmd_19_auto0 .. " \226\150\146")
        end
        cmd_19_auto = {hl = _45_, provider = _46_}
        local cwd_3f_25_auto = nil
        local _7cpid_3f_26_auto = nil
        local pid_3f_27_auto = nil
        local _7ccmd_28_auto = space
        do
          local cwdproto_29_auto
          local function _47_(self_14_auto)
            return self_14_auto["showcwd?"]
          end
          cwdproto_29_auto = {condition = _47_}
          local icon_7ccwd_30_auto
          local function _48_(self_14_auto)
            return {bg = self_14_auto["icon-color"], fg = "termcwd"}
          end
          icon_7ccwd_30_auto = {hl = _48_, provider = "\226\150\146"}
          local cwd_17_auto
          local function _49_(self_14_auto)
            return ("\238\151\190 " .. vim.fn.fnamemodify(self_14_auto.cwd, ":."))
          end
          cwd_17_auto = {hl = {fg = "termcwd", reverse = true}, provider = _49_}
          cwd_3f_25_auto = insert_12_auto(cwdproto_29_auto, icon_7ccwd_30_auto, cwd_17_auto)
          local function _50_(self_14_auto)
            local _51_
            if self_14_auto["showcwd?"] then
              _51_ = "termcwd"
            else
              _51_ = self_14_auto["icon-color"]
            end
            return {bg = _51_, fg = "termpid"}
          end
          _7cpid_3f_26_auto = {hl = _50_, provider = "\226\150\146"}
          local function _53_(self_14_auto)
            return ("\239\138\146 " .. self_14_auto.pid)
          end
          pid_3f_27_auto = {hl = {fg = "termpid", reverse = true}, provider = _53_}
          _7ccmd_28_auto = {hl = {bg = "termpid", fg = "termcmd"}, provider = "\226\150\146"}
        end
        local function _54_()
          local tbl_17_auto = {}
          local i_18_auto = #tbl_17_auto
          for __7_auto, v_8_auto in next, {proto_13_auto, icon_space_21_auto, cwd_3f_25_auto, _7cpid_3f_26_auto, pid_3f_27_auto, _7ccmd_28_auto, cmd_19_auto} do
            local val_19_auto = v_8_auto
            if (nil ~= val_19_auto) then
              i_18_auto = (i_18_auto + 1)
              do end (tbl_17_auto)[i_18_auto] = val_19_auto
            else
            end
          end
          return tbl_17_auto
        end
        _40_ = insert_12_auto(unpack(_54_()))
      end
      local function _56_(self_42_auto)
        return {fg = self_42_auto["icon-color"], reverse = true}
      end
      local function _57_(self_42_auto)
        local name_54_auto = vim.fn.fnamemodify(self_42_auto.name, ":.")
        local function _58_()
          if w_25_3c_3f_38_auto(#name_54_auto, 0.25) then
            return name_54_auto
          else
            return vim.fn.pathshorten(name_54_auto)
          end
        end
        return (" " .. _58_() .. " \226\150\146")
      end
      ty_63_auto = clone_39_auto({_40_, {hl = _56_, provider = _57_}}, {fallthrough = false})
      local flags_7cicon_3f_66_auto = nil
      local function _59_(self_42_auto)
        if ((self_42_auto.bufty ~= "terminal") and self_42_auto["mod?"]) then
          return {bg = "bufmod", fg = self_42_auto["icon-color"]}
        elseif ((self_42_auto.bufty ~= "terminal") and self_42_auto["locked?"]) then
          return {bg = "buflocked", fg = self_42_auto["icon-color"]}
        else
          return {bg = self_42_auto["icon-color"]}
        end
      end
      local function _61_(self_42_auto)
        if ((self_42_auto.bufty ~= "terminal") and (self_42_auto["locked?"] or self_42_auto["mod?"])) then
          return "\226\150\146"
        else
          return " "
        end
      end
      flags_7cicon_3f_66_auto = {hl = _59_, provider = _61_}
      local function _63_()
        local tbl_17_auto = {}
        local i_18_auto = #tbl_17_auto
        for __7_auto, v_8_auto in next, {proto_41_auto, flags_56_auto, flags_7cicon_3f_66_auto, icon_50_auto, ty_63_auto} do
          local val_19_auto = v_8_auto
          if (nil ~= val_19_auto) then
            i_18_auto = (i_18_auto + 1)
            do end (tbl_17_auto)[i_18_auto] = val_19_auto
          else
          end
        end
        return tbl_17_auto
      end
      _23_ = insert_40_auto(unpack(_63_()))
    end
    local _65_
    do
      local proto_80_auto
      local function _66_()
        return not ((vim.api.nvim_eval_statusline("%S", {})).str == "")
      end
      proto_80_auto = {condition = _66_}
      local cmd_81_auto = {hl = {fg = "termpid", reverse = true}, provider = " %S \226\150\146"}
      _65_ = heirline_utils.insert(proto_80_auto, cmd_81_auto, space)
    end
    local function _67_(self_82_auto)
      local function _68_()
        if (vim.bo.fenc ~= "") then
          return vim.bo.fenc
        else
          return nil
        end
      end
      self_82_auto.enc = (_68_() or vim.o.enc)
      return nil
    end
    local function _70_(self_82_auto)
      return (" " .. (self_82_auto.enc):upper())
    end
    local function _71_(self_82_auto)
      self_82_auto.fmt = vim.bo.fileformat
      return nil
    end
    local function _72_(self_82_auto)
      local _73_ = self_82_auto.fmt
      if (_73_ == "dos") then
        return "\238\152\169"
      elseif (_73_ == "mac") then
        return "\239\140\130"
      elseif (_73_ == "unix") then
        return "\239\133\188"
      else
        return nil
      end
    end
    local function _77_()
      local proto_83_auto
      local function _75_(self_82_auto)
        if not self_82_auto.once then
          api.nvim_create_autocmd("CursorMoved", {command = "redrawstatus", pattern = "*:*o"})
          self_82_auto.once = true
          return nil
        else
          return nil
        end
      end
      proto_83_auto = {init = _75_}
      local ln_84_auto = {hl = {fg = "fileln", reverse = true}, provider = " \238\130\161%l"}
      local ln_7ccol_85_auto = {hl = {bg = "fileln", fg = "filecn"}, provider = "\226\150\146"}
      local col_86_auto = {hl = {fg = "filecn", reverse = true}, provider = "\238\130\163%c \226\150\146"}
      return heirline_utils.insert(proto_83_auto, ln_84_auto, ln_7ccol_85_auto, col_86_auto)
    end
    local function _78_(self_87_auto)
      local line_88_auto = (api.nvim_win_get_cursor(0))[1]
      local lines_89_auto = api.nvim_buf_line_count(0)
      local i_90_auto = math.floor((((line_88_auto / lines_89_auto) * (#self_87_auto.bar - 1)) + 1))
      return (self_87_auto.bar)[i_90_auto]
    end
    local _79_
    do
      local _let_80_ = heirline_conditions
      local active_3f_98_auto = _let_80_["is_active"]
      local _let_81_ = heirline_utils
      local clone_99_auto = _let_81_["clone"]
      local function _107_()
        local _let_82_ = heirline_conditions
        local w_25_3c_3f_38_auto = _let_82_["width_percent_below"]
        local _let_83_ = heirline_utils
        local clone_39_auto = _let_83_["clone"]
        local insert_40_auto = _let_83_["insert"]
        local proto_41_auto
        local function _84_(self_42_auto)
          local bufty_43_auto = vim.bo.buftype
          local ft_44_auto
          if (bufty_43_auto == term_45_auto) then
            ft_44_auto = term_45_auto
          else
            ft_44_auto = vim.bo.filetype
          end
          local locked_3f_46_auto
          do
            local bo_47_auto = vim.bo[0]
            locked_3f_46_auto = (not bo_47_auto.modifiable or bo_47_auto.readonly)
          end
          local mod_3f_48_auto = vim.bo.modified
          local term_45_auto = "terminal"
          local _let_86_ = devicons
          local icon_color_by_ft_49_auto = _let_86_["get_icon_color_by_filetype"]
          local icon_50_auto, color_51_auto = icon_color_by_ft_49_auto(ft_44_auto, {default = true})
          local active_3f_52_auto = heirline_conditions.is_active
          local name_54_auto = api.nvim_buf_get_name(0)
          self_42_auto["locked?"] = locked_3f_46_auto
          self_42_auto["mod?"] = mod_3f_48_auto
          self_42_auto.bufty = bufty_43_auto
          self_42_auto.icon = icon_50_auto
          if active_3f_52_auto() then
            self_42_auto["icon-color"] = L_2a_normal(color_51_auto)
          else
            self_42_auto["icon-color"] = L_2a_comment(color_51_auto)
          end
          self_42_auto.name = name_54_auto
          return nil
        end
        proto_41_auto = {init = _84_}
        local flags_56_auto
        local _88_
        do
          local locked_57_auto
          local function _89_(self_42_auto)
            return self_42_auto["locked?"]
          end
          locked_57_auto = {condition = _89_, hl = {fg = "buflocked", reverse = false}, provider = "\239\128\163"}
          local mod_60_auto
          local function _90_(self_42_auto)
            return self_42_auto["mod?"]
          end
          mod_60_auto = {condition = _90_, hl = {fg = "bufmod", reverse = false}, provider = "\226\158\149"}
          local function _91_(self_42_auto)
            return self_42_auto["mod?"]
          end
          _88_ = {locked_57_auto, {condition = _91_, provider = " "}, mod_60_auto}
        end
        local function _92_(self_42_auto)
          return (self_42_auto.bufty ~= "terminal")
        end
        flags_56_auto = clone_39_auto(_88_, {condition = _92_})
        local icon_50_auto
        local function _93_(self_42_auto)
          return {fg = self_42_auto["icon-color"], reverse = false}
        end
        local function _94_(self_42_auto)
          return self_42_auto.icon
        end
        icon_50_auto = {hl = _93_, provider = _94_}
        local ty_63_auto
        local _95_
        do
          local _let_96_ = heirline_utils
          local insert_12_auto = _let_96_["insert"]
          local proto_13_auto
          local function _97_(self_14_auto)
            return (self_14_auto.bufty == "terminal")
          end
          local function _98_(self_14_auto)
            local name_15_auto = api.nvim_buf_get_name(0)
            local __16_auto, __16_auto0, cwd_17_auto, pid_18_auto, cmd_19_auto = name_15_auto:find("term://(.+)//(.+):(.+)")
            self_14_auto.cmd = cmd_19_auto
            return nil
          end
          proto_13_auto = {condition = _97_, init = _98_}
          local icon_space_21_auto
          local function _99_(self_14_auto)
            return {fg = self_14_auto["icon-color"], reverse = false}
          end
          icon_space_21_auto = {hl = _99_, provider = " "}
          local cmd_19_auto
          local function _100_(self_14_auto)
            return {fg = self_14_auto["icon-color"], reverse = false}
          end
          local function _101_(self_14_auto)
            local cmd_19_auto0 = self_14_auto.cmd
            return cmd_19_auto0
          end
          cmd_19_auto = {hl = _100_, provider = _101_}
          local cwd_3f_25_auto = nil
          local _7cpid_3f_26_auto = nil
          local pid_3f_27_auto = nil
          local _7ccmd_28_auto = space
          local function _102_()
            local tbl_17_auto = {}
            local i_18_auto = #tbl_17_auto
            for __7_auto, v_8_auto in next, {proto_13_auto, icon_space_21_auto, cwd_3f_25_auto, _7cpid_3f_26_auto, pid_3f_27_auto, _7ccmd_28_auto, cmd_19_auto} do
              local val_19_auto = v_8_auto
              if (nil ~= val_19_auto) then
                i_18_auto = (i_18_auto + 1)
                do end (tbl_17_auto)[i_18_auto] = val_19_auto
              else
              end
            end
            return tbl_17_auto
          end
          _95_ = insert_12_auto(unpack(_102_()))
        end
        local function _104_(self_42_auto)
          return {fg = self_42_auto["icon-color"], reverse = false}
        end
        local function _105_(self_42_auto)
          local name_54_auto = vim.fn.fnamemodify(self_42_auto.name, ":.")
          local function _106_()
            if w_25_3c_3f_38_auto(#name_54_auto, 0.25) then
              return name_54_auto
            else
              return vim.fn.pathshorten(name_54_auto)
            end
          end
          return (" " .. _106_())
        end
        ty_63_auto = clone_39_auto({_95_, {hl = _104_, provider = _105_}}, {fallthrough = false})
        local flags_7cicon_3f_66_auto = nil
        local function _108_()
          local tbl_17_auto = {}
          local i_18_auto = #tbl_17_auto
          for __7_auto, v_8_auto in next, {proto_41_auto, flags_56_auto, flags_7cicon_3f_66_auto, icon_50_auto, ty_63_auto} do
            local val_19_auto = v_8_auto
            if (nil ~= val_19_auto) then
              i_18_auto = (i_18_auto + 1)
              do end (tbl_17_auto)[i_18_auto] = val_19_auto
            else
            end
          end
          return tbl_17_auto
        end
        return insert_40_auto(unpack(_108_()))
      end
      local function _110_()
        if active_3f_98_auto() then
          return {bg = "winbarbg", bold = true, fg = "winbarfg"}
        else
          return {bg = "winbarncbg", bold = true, fg = "winbarncfg"}
        end
      end
      _79_ = clone_99_auto({space, _107_()}, {hl = _110_})
    end
    local function _119_()
      local proto_92_auto
      local function _112_(self_93_auto)
        if self_93_auto.is_active then
          return {bg = "tablineselbg", bold = true, fg = "tablineselfg"}
        else
          return {bg = "tablinebg", bold = true, fg = "tablinefg"}
        end
      end
      local function _114_(self_93_auto)
        self_93_auto.name = api.nvim_buf_get_name(self_93_auto.bufnr)
        self_93_auto.type = (vim.bo[self_93_auto.bufnr]).buftype
        return nil
      end
      local function _115_(__94_auto, minwid_95_auto, __94_auto0, button_96_auto)
        if (button_96_auto == "l") then
          return api.nvim_win_set_buf(0, minwid_95_auto)
        elseif (button_96_auto == "r") then
          return api.nvim_buf_delete(minwid_95_auto, {force = false})
        else
          return nil
        end
      end
      local function _117_(self_93_auto)
        return self_93_auto.bufnr
      end
      proto_92_auto = {hl = _112_, init = _114_, on_click = {callback = _115_, minwid = _117_, name = "bufln_click_cb"}}
      local nr_97_auto
      local function _118_(self_93_auto)
        return self_93_auto.bufnr
      end
      nr_97_auto = {provider = _118_}
      local _120_
      do
        local proto_68_auto
        local function _121_(self_69_auto)
          return vim.diagnostic.get(self_69_auto.bufnr)
        end
        local function _122_(self_69_auto, severity_70_auto)
          return (0 < #vim.diagnostic.get(self_69_auto.bufnr, {severity = vim.diagnostic.severity[severity_70_auto]}))
        end
        proto_68_auto = {condition = _121_, static = {has = _122_}}
        local sign_71_auto
        local function _123_(severity_70_auto)
          return ((vim.fn.sign_getdefined(("DiagnosticSign" .. severity_70_auto)))[1]).text
        end
        sign_71_auto = _123_
        local mksign_72_auto
        local function _124_(key_73_auto, signsufx_74_auto, hl_75_auto)
          local function _125_(self_69_auto)
            return self_69_auto:has(key_73_auto)
          end
          local function _126_(self_69_auto)
            return self_69_auto.sign
          end
          return {condition = _125_, hl = {fg = hl_75_auto}, provider = _126_, static = {sign = sign_71_auto(signsufx_74_auto)}}
        end
        mksign_72_auto = _124_
        local err_76_auto = mksign_72_auto("ERROR", "Error", "diagnerr")
        local warn_77_auto = mksign_72_auto("WARN", "Warn", "diagnwarn")
        local info_78_auto = mksign_72_auto("INFO", "Info", "diagninfo")
        local hint_79_auto = mksign_72_auto("HINT", "Hint", "diagnhint")
        _120_ = heirline_utils.insert(proto_68_auto, err_76_auto, warn_77_auto, info_78_auto, hint_79_auto)
      end
      local _127_
      do
        local _let_128_ = heirline_conditions
        local w_25_3c_3f_38_auto = _let_128_["width_percent_below"]
        local _let_129_ = heirline_utils
        local clone_39_auto = _let_129_["clone"]
        local insert_40_auto = _let_129_["insert"]
        local proto_41_auto
        local function _130_(self_42_auto)
          local bufty_43_auto = (vim.bo[(self_42_auto).bufnr]).buftype
          local ft_44_auto
          if (bufty_43_auto == term_45_auto) then
            ft_44_auto = term_45_auto
          else
            ft_44_auto = (vim.bo[(self_42_auto).bufnr]).filetype
          end
          local locked_3f_46_auto
          do
            local bo_47_auto = vim.bo[(self_42_auto).bufnr]
            locked_3f_46_auto = (not bo_47_auto.modifiable or bo_47_auto.readonly)
          end
          local mod_3f_48_auto = (vim.bo[(self_42_auto).bufnr]).modified
          local term_45_auto = "terminal"
          local _let_132_ = devicons
          local icon_color_by_ft_49_auto = _let_132_["get_icon_color_by_filetype"]
          local icon_50_auto, color_51_auto = icon_color_by_ft_49_auto(ft_44_auto, {default = true})
          local active_3f_52_auto = nil
          local name_54_auto = api.nvim_buf_get_name((self_42_auto).bufnr)
          self_42_auto["locked?"] = locked_3f_46_auto
          self_42_auto["mod?"] = mod_3f_48_auto
          self_42_auto.bufty = bufty_43_auto
          self_42_auto.icon = icon_50_auto
          if self_42_auto.is_active then
            self_42_auto["icon-color"] = L_2a_normal(color_51_auto)
          elseif self_42_auto.is_visible then
            self_42_auto["icon-color"] = L_2a_comment(color_51_auto)
          else
            self_42_auto["icon-color"] = L_2a_linenr(color_51_auto)
          end
          self_42_auto.name = name_54_auto
          return nil
        end
        proto_41_auto = {init = _130_}
        local flags_56_auto
        local _134_
        do
          local locked_57_auto
          local function _135_(self_42_auto)
            return self_42_auto["locked?"]
          end
          locked_57_auto = {condition = _135_, hl = {fg = "buflocked", reverse = false}, provider = "\239\128\163"}
          local mod_60_auto
          local function _136_(self_42_auto)
            return self_42_auto["mod?"]
          end
          mod_60_auto = {condition = _136_, hl = {fg = "bufmod", reverse = false}, provider = "\226\158\149"}
          local function _137_(self_42_auto)
            return self_42_auto["mod?"]
          end
          _134_ = {locked_57_auto, {condition = _137_, provider = " "}, mod_60_auto}
        end
        local function _138_(self_42_auto)
          return (self_42_auto.bufty ~= "terminal")
        end
        flags_56_auto = clone_39_auto(_134_, {condition = _138_})
        local icon_50_auto
        local function _139_(self_42_auto)
          return {fg = self_42_auto["icon-color"], reverse = false}
        end
        local function _140_(self_42_auto)
          return self_42_auto.icon
        end
        icon_50_auto = {hl = _139_, provider = _140_}
        local ty_63_auto
        local _141_
        do
          local _let_142_ = heirline_utils
          local insert_12_auto = _let_142_["insert"]
          local proto_13_auto
          local function _143_(self_14_auto)
            return (self_14_auto.bufty == "terminal")
          end
          local function _144_(self_14_auto)
            local name_15_auto = api.nvim_buf_get_name((self_14_auto).bufnr)
            local __16_auto, __16_auto0, cwd_17_auto, pid_18_auto, cmd_19_auto = name_15_auto:find("term://(.+)//(.+):(.+)")
            self_14_auto.cmd = cmd_19_auto
            return nil
          end
          proto_13_auto = {condition = _143_, init = _144_}
          local icon_space_21_auto
          local function _145_(self_14_auto)
            return {fg = self_14_auto["icon-color"], reverse = false}
          end
          icon_space_21_auto = {hl = _145_, provider = " "}
          local cmd_19_auto
          local function _146_(self_14_auto)
            return {fg = self_14_auto["icon-color"], reverse = false}
          end
          local function _147_(self_14_auto)
            local cmd_19_auto0 = vim.fn.fnamemodify(self_14_auto.cmd, ":t")
            return cmd_19_auto0
          end
          cmd_19_auto = {hl = _146_, provider = _147_}
          local cwd_3f_25_auto = nil
          local _7cpid_3f_26_auto = nil
          local pid_3f_27_auto = nil
          local _7ccmd_28_auto = space
          local function _148_()
            local tbl_17_auto = {}
            local i_18_auto = #tbl_17_auto
            for __7_auto, v_8_auto in next, {proto_13_auto, icon_space_21_auto, cwd_3f_25_auto, _7cpid_3f_26_auto, pid_3f_27_auto, _7ccmd_28_auto, cmd_19_auto} do
              local val_19_auto = v_8_auto
              if (nil ~= val_19_auto) then
                i_18_auto = (i_18_auto + 1)
                do end (tbl_17_auto)[i_18_auto] = val_19_auto
              else
              end
            end
            return tbl_17_auto
          end
          _141_ = insert_12_auto(unpack(_148_()))
        end
        local function _150_(self_42_auto)
          return {fg = self_42_auto["icon-color"], reverse = false}
        end
        local function _151_(self_42_auto)
          local name_54_auto = vim.fn.fnamemodify(self_42_auto.name, ":.")
          return (" " .. vim.fn.fnamemodify(name_54_auto, ":t"))
        end
        ty_63_auto = clone_39_auto({_141_, {hl = _150_, provider = _151_}}, {fallthrough = false})
        local flags_7cicon_3f_66_auto = nil
        local function _152_()
          local tbl_17_auto = {}
          local i_18_auto = #tbl_17_auto
          for __7_auto, v_8_auto in next, {proto_41_auto, flags_56_auto, flags_7cicon_3f_66_auto, icon_50_auto, ty_63_auto} do
            local val_19_auto = v_8_auto
            if (nil ~= val_19_auto) then
              i_18_auto = (i_18_auto + 1)
              do end (tbl_17_auto)[i_18_auto] = val_19_auto
            else
            end
          end
          return tbl_17_auto
        end
        _127_ = insert_40_auto(unpack(_152_()))
      end
      return heirline_utils.insert(proto_92_auto, space, nr_97_auto, space, _120_, _127_, space)
    end
    local function _154_(args)
      local buf = args.buf
      local tbl_has = vim.tbl_contains
      local buftype = tbl_has({"help", "nofile", "prompt", "quickfix"}, vim.bo[buf].buftype)
      local filetype = tbl_has({"neo-tree"}, vim.bo[buf].buftype)
      return (buftype or filetype)
    end
    do end (require("heirline")).setup({statusline = heirline_utils.insert({hl = {bg = "statuslinebg", bold = true, fg = "statuslinefg"}}, {hl = _11_, init = _12_, provider = _14_, static = {aliases = {["\19"] = "^S", ["\22"] = "^V", ["\22s"] = "^Vs", ["no\22"] = "no^V"}}, update = "ModeChanged"}, space, _18_, _23_, {provider = "%="}, _65_, {{hl = {fg = "fileenc", reverse = true}, init = _67_, provider = _70_}, {hl = {bg = "fileenc", fg = "filefmt"}, provider = "\226\150\146"}, {hl = {fg = "filefmt", reverse = true}, init = _71_, provider = _72_}, {hl = {bg = "filefmt", fg = "fileln"}, provider = "\226\150\146"}, _77_()}, space, {hl = {fg = "scroll"}, provider = _78_, static = {bar = {"\226\150\136", "\226\150\135", "\226\150\134", "\226\150\133", "\226\150\132", "\226\150\131", "\226\150\130", "\226\150\129"}}}), winbar = _79_, tabline = heirline_utils.make_buflist(_119_()), opts = {disable_winbar_cb = _154_}})
    vim.opt.showtabline = 2
    return nil
  end
  local colors = fetch_colors_21()
  local api = vim.api
  local group = api.nvim_create_augroup("uma-dlc.plugins.heirline.def-hl", {clear = true})
  do end (require("heirline")).load_colors(colors)
  setup_statuslines()
  local function _155_()
    local colors0 = fetch_colors_21()
    return (require("heirline.utils")).on_colorscheme(colors0)
  end
  return api.nvim_create_autocmd("ColorScheme", {desc = "Defines highlight colors for Heirline.", group = group, callback = _155_})
end
return {"rebelot/heirline.nvim", event = "UIEnter", config = config, dependencies = {"atchim/sopa.nvim", "kyazdani42/nvim-web-devicons", "uga-rosa/ccc.nvim"}}
