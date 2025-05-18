local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

lspconfig.rust_analyzer.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
})

lspconfig.clangd.setup({})
