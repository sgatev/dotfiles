local blink_cmp = require('blink.cmp')
local lspconfig = require('lspconfig')
local fzf_lua = require('fzf-lua')

vim.lsp.set_log_level("off")

vim.lsp.config('*', { capabilities = blink_cmp.get_lsp_capabilities(nil, true) })

lspconfig.rust_analyzer.setup({})

lspconfig.zls.setup({})

lspconfig.clangd.setup({})

lspconfig.lua_ls.setup({})

lspconfig.bashls.setup({})

vim.keymap.set('n', '<leader>cD', vim.lsp.buf.definition, { desc = 'Jump to definition' })
vim.keymap.set('n', '<leader>ca', fzf_lua.lsp_code_actions, { desc = 'Open code actions' })
vim.keymap.set('n', '<leader>cc', fzf_lua.lsp_incoming_calls, { desc = 'Open incoming calls' })
vim.keymap.set('n', '<leader>cd', vim.lsp.buf.declaration, { desc = 'Jump to declaration' })
vim.keymap.set('n', '<leader>ce', fzf_lua.diagnostics_document, { desc = 'Open diagnostics' })
vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Format buffer' })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>cs', fzf_lua.lsp_document_symbols, { desc = 'Open symbols' })
vim.keymap.set('n', '<leader>cx', fzf_lua.lsp_references, { desc = 'Open references' })
