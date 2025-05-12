require('illuminate').configure({
  providers = {
    'lsp',
    'treesitter',
  },
})

vim.cmd([[
hi def IlluminatedWordText guibg=#4C566A
hi def IlluminatedWordRead guibg=#4C566A
hi def IlluminatedWordWrite guibg=#4C566A
]])
