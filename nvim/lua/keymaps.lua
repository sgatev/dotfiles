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
map('n', '<leader>fn', '<cmd>ObsidianQuickSwitch<cr>')

-- https://github.com/alexghergh/nvim-tmux-navigation?tab=readme-ov-file
local nvim_tmux_nav = require('nvim-tmux-navigation')
vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- https://github.com/epwalsh/obsidian.nvim
vim.keymap.set("n", "gf", function()
  if require("obsidian").util.cursor_on_markdown_link() then
    return "<cmd>ObsidianFollowLink<CR>"
  else
    return "gf"
  end
end, { noremap = false, expr = true })
