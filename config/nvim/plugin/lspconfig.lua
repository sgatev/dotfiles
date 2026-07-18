vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
})

local fzf_lua = require('fzf-lua')

vim.lsp.set_log_level("off")

vim.lsp.enable('bashls')
vim.lsp.enable('clangd')
vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('zls')

-- Formats a buffer.
local function format()
  return vim.lsp.buf.format({
    timeout_ms = 10000,
  })
end

vim.keymap.set('n', '<leader>cD', vim.lsp.buf.definition, { desc = 'Jump to definition' })
vim.keymap.set('n', '<leader>ca', fzf_lua.lsp_code_actions, { desc = 'Open code actions' })
vim.keymap.set('n', '<leader>cc', fzf_lua.lsp_incoming_calls, { desc = 'Open incoming calls' })
vim.keymap.set('n', '<leader>cd', vim.lsp.buf.declaration, { desc = 'Jump to declaration' })
vim.keymap.set('n', '<leader>ce', fzf_lua.diagnostics_document, { desc = 'Open diagnostics' })
vim.keymap.set('n', '<leader>cf', format, { desc = 'Format buffer' })
vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>cs', fzf_lua.lsp_document_symbols, { desc = 'Open symbols' })
vim.keymap.set('n', '<leader>cx', fzf_lua.lsp_references, { desc = 'Open references' })
