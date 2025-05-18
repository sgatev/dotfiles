local nvim_tmux_navigation = require('nvim-tmux-navigation')

nvim_tmux_navigation.setup({
  disable_when_zoomed = true,
})

vim.keymap.set('n', "<C-h>", nvim_tmux_navigation.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", nvim_tmux_navigation.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", nvim_tmux_navigation.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", nvim_tmux_navigation.NvimTmuxNavigateRight)
vim.keymap.set('n', "<C-\\>", nvim_tmux_navigation.NvimTmuxNavigateLastActive)
vim.keymap.set('n', "<C-Space>", nvim_tmux_navigation.NvimTmuxNavigateNext)
