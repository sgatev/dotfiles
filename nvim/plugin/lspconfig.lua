local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspconfig = require('lspconfig')

vim.lsp.set_log_level("off")

lspconfig.rust_analyzer.setup({
  capabilities = cmp_nvim_lsp.default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
})

lspconfig.clangd.setup({})

lspconfig.lua_ls.setup({})

lspconfig.bashls.setup({})

vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Format buffer' })
