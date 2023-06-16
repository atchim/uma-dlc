local function config_21()
  local function on_attach_21(client, bufnr)
    local api = vim.api
    local group = api.nvim_create_augroup(("uma-dlc.lspconfig.on_attach." .. bufnr), {})
    local ns_name = ("vim.lsp." .. client.name .. "." .. bufnr)
    local diagn = vim.diagnostic
    local ns
    do
      local found = false
      local ns0 = nil
      for i, data in pairs(diagn.get_namespaces()) do
        if found then break end
        ns0 = i
        found = (ns_name == data.name)
      end
      ns = ns0
    end
    local map = vim.keymap.set
    local mapn
    local function _1_(lhs, rhs, desc)
      return map("n", lhs, rhs, {buffer = bufnr, desc = desc})
    end
    mapn = _1_
    if client.supports_method("textDocument/formatting") then
      local function _2_()
        local autofmt = vim.b.uma_dlc_lspconfig_autofmt
        if ((nil == autofmt) or autofmt) then
          return vim.lsp.buf.format({bufnr = bufnr})
        else
          return nil
        end
      end
      api.nvim_create_autocmd("BufWritePre", {desc = "Auto format on write", group = group, callback = _2_, buffer = bufnr})
      local function _4_()
        local b = vim.b[bufnr]
        local autofmt = b.uma_dlc_lspconfig_autofmt
        local value = not ((nil == autofmt) or autofmt)
        local action
        if value then
          action = "enabled"
        else
          action = "disabled"
        end
        local msg = (action .. " LSP auto format on write")
        b.uma_dlc_lspconfig_autofmt = value
        return vim.notify(msg, vim.log.levels.INFO)
      end
      mapn("<Leader>tf", _4_, "Local auto format on write")
    else
    end
    local old_vt = diagn.config().virtual_text
    local function _7_()
      local ns_config = diagn.config(nil, ns)
      local vt = ns_config.virtual_text
      local vt0
      if (nil == vt) then
        vt0 = old_vt
      else
        vt0 = vt
      end
      if vt0 then
        old_vt = vt0
        ns_config.virtual_text = false
      else
        ns_config.virtual_text = old_vt
      end
      return diagn.config(ns_config, ns)
    end
    mapn("<Leader>tv", _7_, "Virtual text")
    map("v", "<Leader>lf", "<Cmd>lua vim.lsp.buf.format()<CR>", {buffer = bufnr, desc = "Format"})
    mapn("<C-H>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", "LSP signature help")
    mapn("<C-]>", "<Cmd>lua vim.lsp.buf.definition()<CR>", "LSP go to symbol definition")
    mapn("<Leader>lf", "<Cmd>lua vim.lsp.buf.format()<CR>", "Format")
    mapn("<Leader>ls", "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", "Document symbols")
    mapn("<Leader>lS", "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace symbols")
    mapn("cr", "<Cmd>lua vim.lsp.buf.rename()<CR>", "LSP symbol rename")
    mapn("gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>", "LSP symbol declaration")
    mapn("gD", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "LSP type definition")
    mapn("gm", "<Cmd>lua vim.lsp.buf.implementation()<CR>", "LSP implementations")
    mapn("go", "<Cmd>lua vim.lsp.buf.code_action()<CR>", "LSP code action")
    mapn("gr", "<Cmd>lua vim.lsp.buf.references()<CR>", "LSP references")
    return mapn("K", "<Cmd>lua vim.lsp.buf.hover()<CR>", "LSP hover information")
  end
  local api = vim.api
  local capabilities = (require("cmp_nvim_lsp")).default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local function _10_(server)
    return ((require("lspconfig"))[server]).setup({capabilities = capabilities, on_attach = on_attach_21})
  end
  local function _11_()
    return ((require("lspconfig")).fennel_language_server).setup({capabilities = capabilities, on_attach = on_attach_21, settings = {fennel = {diagnostics = {globals = {"vim"}}, workspace = {library = api.nvim_list_runtime_paths()}}}})
  end
  local function _12_()
    return ((require("lspconfig")).lua_ls).setup({capabilities = capabilities, on_attach = on_attach_21, settings = {Lua = {diagnostics = {globals = {"vim"}}, workspace = {library = api.nvim_get_runtime_file("", true), checkThirdParty = false}}}})
  end
  return (require("mason-lspconfig")).setup_handlers({_10_, fennel_language_server = _11_, lua_ls = _12_})
end
return {{"j-hui/fidget.nvim", event = "LspAttach", opts = {text = {spinner = "dots"}}}, {"neovim/nvim-lspconfig", event = "BufRead", config = config_21, dependencies = {"williamboman/mason-lspconfig.nvim", config = true, dependencies = {"williamboman/mason.nvim", cmd = {"Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog"}, config = true}}}}
