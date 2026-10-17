vim.pack.add({
  'https://github.com/RRethy/vim-illuminate',
})

local illuminate = require('illuminate')

illuminate.configure({
  providers = {
    'lsp',
    'treesitter',
  },
})
