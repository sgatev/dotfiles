vim.pack.add({
  'https://github.com/stevearc/conform.nvim',
})

local conform = require('conform')

conform.setup({
  -- Fall back to the language server for filetypes without a formatter below.
  default_format_opts = {
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    bzl = { 'buildifier' },
  },
})
