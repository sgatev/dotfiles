-- set up https://www.nordtheme.com
vim.api.nvim_command('colorscheme nord')
vim.g.lightline = {
  colorscheme = 'nord'
}

vim.o.termguicolors = true  -- emit true (24-bit) colors
vim.o.showmode = false      -- do not show the current mode
vim.o.number = true         -- show line numbers on the left
vim.o.cursorline = true     -- highlight the current line
vim.o.tabstop = 2           -- 1 tab = 2 spaces
vim.o.softtabstop = 2       -- show existing tabs as 2 spaces
vim.o.shiftwidth = 2        -- indent with 2 spaces
vim.o.expandtab = true      -- expand tab to spaces
vim.o.clipboard = 'unnamed' -- copy/paste to system clipboard
vim.o.hlsearch = false      -- do not highlight search matches
