vim.g.mapleader = ','

vim.o.clipboard = 'unnamed'                                 -- Copy/paste to system clipboard.
vim.o.cursorline = true                                     -- Highlight the current line.
vim.o.expandtab = true                                      -- Expand tab to spaces.
vim.o.hlsearch = false                                      -- Do not highlight search matches.
vim.o.number = true                                         -- Show line numbers on the left.
vim.o.relativenumber = true                                 -- Show relative line numbers.
vim.o.shiftwidth = 2                                        -- Indent with 2 spaces.
vim.o.showmode = false                                      -- Do not show the current mode.
vim.o.signcolumn = 'yes'                                    -- Show sign column by default.
vim.o.softtabstop = 2                                       -- Show existing tabs as 2 spaces.
vim.o.statusline = "%!v:lua.require('statusline').render()" -- Render status line.
vim.o.tabstop = 2                                           -- Emit 2 spaces on tab.
vim.o.termguicolors = true                                  -- Emit true (24-bit) colors.

-- Buffer navigation.
vim.keymap.set('n', 'L', '<cmd>bnext<cr>')
vim.keymap.set('n', 'H', '<cmd>bprevious<cr>')
vim.keymap.set('n', 'X', '<cmd>bd<cr>')
