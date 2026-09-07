vim.pack.add({
  'https://github.com/kevinhwang91/nvim-ufo',
  'https://github.com/kevinhwang91/promise-async',
})

local ufo = require('ufo')

ufo.setup()

vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', 'zR', ufo.openAllFolds)
vim.keymap.set('n', 'zM', ufo.closeAllFolds)
