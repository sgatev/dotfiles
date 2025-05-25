local fzf_lua = require('fzf-lua')

fzf_lua.setup({
  'border-fused',
  winopts = {
    backdrop = 80,
  },
})

fzf_lua.register_ui_select()

vim.keymap.set('n', '<leader>fb', fzf_lua.buffers, { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>ff', fzf_lua.files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', fzf_lua.live_grep, { desc = 'Grep in files' })
