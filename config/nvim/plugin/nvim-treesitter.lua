local nvim_treesitter = require('nvim-treesitter')

nvim_treesitter.setup({
  ensure_installed = {
    "bash",
    "lua",
    "markdown",
    "markdown_inline",
    "tmux",
  },
  highlight = {
    enable = true,
  },
})
