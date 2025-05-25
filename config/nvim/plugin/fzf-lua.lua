local fzf_lua = require('fzf-lua')

fzf_lua.setup({
  'border-fused',
  winopts = {
    backdrop = 80,
  },
})

vim.keymap.set('n', '<leader>fb', fzf_lua.buffers, { desc = 'Fzf buffers' })
vim.keymap.set('n', '<leader>ff', fzf_lua.files, { desc = 'Fzf files' })
vim.keymap.set('n', '<leader>fg', fzf_lua.live_grep, { desc = 'Fzf grep' })
