require("plugins")

vim.g.mapleader = ","
vim.g.lightline = {
  colorscheme = "nord"
}

vim.api.nvim_command([[colorscheme nord]])

vim.o.termguicolors = true -- emit true (24-bit) colors
vim.o.showmode = false     -- do not show the current mode
vim.o.number = true        -- show line numbers on the left
vim.o.cursorline = true    -- highlight the current line
vim.o.tabstop = 2          -- 1 tab = 2 spaces
vim.o.softtabstop = 2      -- show existing tabs as 2 spaces
vim.o.shiftwidth = 2       -- indent with 2 spaces
vim.o.expandtab = true     -- expand tab to spaces

vim.api.nvim_set_keymap(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<cr>",
  { noremap = true }
 )
vim.api.nvim_set_keymap(
  "n",
  "<leader>fg",
  "<cmd>Telescope live_grep<cr>",
  { noremap = true }
 )
vim.api.nvim_set_keymap(
  "n",
  "<leader>fb",
  "<cmd>Telescope buffers<cr>",
  { noremap = true }
 )
vim.api.nvim_set_keymap(
  "n",
  "<leader>fh",
  "<cmd>Telescope help_tags<cr>",
  { noremap = true }
 )

local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        -- Do not to enter a normal-like mode when hitting escape.
        ["<esc>"] = actions.close
      },
    },
  },
  pickers = {
    find_files = {
      -- Remove ./ from fd results.
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" }
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true
    }
  }
}
require('telescope').load_extension('fzf')

--

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.rust_analyzer.setup {
  capabilities = capabilities
}
