local function setup()
  local function map_21(mode, lhs, rhs, _3fopts)
    local opts = (_3fopts or {})
    return vim.keymap.set(mode, lhs, rhs, opts)
  end
  local function _1_()
    return vim.lsp.buf.signature_help()
  end
  map_21("n", "<C-H>", _1_, {desc = "LSP signature help"})
  local function _2_()
    return vim.lsp.buf.format()
  end
  map_21("n", "<Leader>lf", _2_, {desc = "Format"})
  local function _3_()
    return vim.lsp.buf.document_symbol()
  end
  map_21("n", "<Leader>ls", _3_, {desc = "Document symbols"})
  local function _4_()
    return vim.lsp.buf.workspace_symbol()
  end
  map_21("n", "<Leader>lS", _4_, {desc = "Workspace symbols"})
  local function _5_()
    return vim.lsp.buf.rename()
  end
  map_21("n", "cr", _5_, {desc = "LSP symbol rename"})
  local function _6_()
    return vim.lsp.buf.declaration()
  end
  map_21("n", "gd", _6_, {desc = "LSP symbol declaration"})
  local function _7_()
    return vim.lsp.buf.type_definition()
  end
  map_21("n", "gD", _7_, {desc = "LSP type definition"})
  local function _8_()
    return vim.lsp.buf.implementation()
  end
  map_21("n", "gm", _8_, {desc = "LSP implementations"})
  local function _9_()
    return vim.lsp.buf.code_action()
  end
  map_21("n", "go", _9_, {desc = "LSP code action"})
  local function _10_()
    return vim.lsp.buf.references()
  end
  return map_21("n", "gr", _10_, {desc = "LSP references"})
end
return {setup = setup}
