local function config()
  local function on_attach(client, bufnr)
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
    if client.supports_method("textDocument/hover") then
      local function _2_()
        return vim.lsp.buf.hover()
      end
      mapn("K", _2_, "LSP hover information")
    else
    end
    if client.supports_method("textDocument/definition") then
      local function _4_()
        return vim.lsp.buf.definition()
      end
      mapn("<C-]>", _4_, "LSP go to symbol definition")
    else
    end
    if client.supports_method("textDocument/formatting") then
      local function _6_()
        local autofmt = vim.b.uma_dlc_lspconfig_autofmt
        if ((nil == autofmt) or autofmt) then
          return vim.lsp.buf.format({bufnr = bufnr})
        else
          return nil
        end
      end
      api.nvim_create_autocmd("BufWritePre", {desc = "Auto format on write", group = group, callback = _6_, buffer = bufnr})
      local function _8_()
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
      mapn("<Leader>tf", _8_, "Local auto format on write")
    else
    end
    local old_vt = diagn.config().virtual_text
    local function _11_()
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
    mapn("<Leader>tv", _11_, "Virtual text")
    local function _14_()
      return vim.lsp.buf.format()
    end
    return map("v", "<Leader>lf", _14_, {buffer = bufnr, desc = "Format"})
  end
  local api = vim.api
  local capabilities = (require("cmp_nvim_lsp")).default_capabilities(vim.lsp.protocol.make_client_capabilities())
  local function _15_(server)
    return ((require("lspconfig"))[server]).setup({capabilities = capabilities, on_attach = on_attach})
  end
  local function _16_()
    return ((require("lspconfig")).fennel_language_server).setup({capabilities = capabilities, on_attach = on_attach, settings = {fennel = {diagnostics = {globals = {"vim"}}, workspace = {library = api.nvim_list_runtime_paths()}}}})
  end
  local function _17_()
    return ((require("lspconfig")).lua_ls).setup({capabilities = capabilities, on_attach = on_attach, settings = {Lua = {diagnostics = {globals = {"vim"}}, workspace = {library = api.nvim_get_runtime_file("", true), checkThirdParty = false}}}})
  end
  return (require("mason-lspconfig")).setup_handlers({_15_, fennel_language_server = _16_, lua_ls = _17_})
end
return {{"j-hui/fidget.nvim", event = "LspAttach", opts = {text = {spinner = "dots"}}}, {"neovim/nvim-lspconfig", event = {"BufNew", "BufNewFile", "BufReadPre"}, config = config, dependencies = {"williamboman/mason-lspconfig.nvim", config = true, dependencies = {"williamboman/mason.nvim", build = "<Cmd>MasonUpdate", cmd = {"Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog"}, opts = {}}}}}
