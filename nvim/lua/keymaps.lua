vim.g.mapleader = ','

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts['noremap'] = true
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

-- https://github.com/nvim-telescope/telescope.nvim
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>fs', '<cmd>Telescope lsp_document_symbols<cr>')
