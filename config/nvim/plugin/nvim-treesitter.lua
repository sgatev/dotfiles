local nvim_treesitter_config = require('nvim-treesitter.configs')

nvim_treesitter_config.setup({
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
