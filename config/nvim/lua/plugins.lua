vim.call('plug#begin')

local Plug = vim.fn['plug#']

-- https://www.nordtheme.com
Plug('gbprod/nord.nvim')

-- https://github.com/nvim-treesitter/nvim-treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- https://github.com/ibhagwan/fzf-lua
Plug('ibhagwan/fzf-lua')

-- https://github.com/stevearc/oil.nvim
Plug('stevearc/oil.nvim')

-- https://github.com/hrsh7th/nvim-cmp
Plug('neovim/nvim-lspconfig')
Plug('saghen/blink.cmp', { ['do'] = 'cargo build --release' })

-- https://github.com/folke/trouble.nvim
Plug('folke/trouble.nvim')

-- https://github.com/folke/noice.nvim
Plug('MunifTanjim/nui.nvim')
Plug('folke/noice.nvim')

-- https://github.com/smoka7/hop.nvim
Plug('smoka7/hop.nvim')

-- https://github.com/RRethy/vim-illuminate
Plug('RRethy/vim-illuminate')

-- https://github.com/folke/which-key.nvim
Plug('folke/which-key.nvim')

-- https://github.com/alexghergh/nvim-tmux-navigation
Plug('alexghergh/nvim-tmux-navigation')

-- https://github.com/lewis6991/gitsigns.nvim
Plug('lewis6991/gitsigns.nvim')

-- https://github.com/sgatev/nvim-lucid
Plug('sgatev/nvim-lucid')

-- https://github.com/echasnovski/mini.nvim
Plug('echasnovski/mini.nvim')

-- https://github.com/junegunn/limelight.vim
Plug('junegunn/limelight.vim')

-- https://github.com/kevinhwang91/nvim-ufo
Plug('kevinhwang91/promise-async')
Plug('kevinhwang91/nvim-ufo')

-- https://github.com/ziglang/zig.vim
Plug('ziglang/zig.vim')

-- https://github.com/nvim-lua/plenary.nvim
Plug('nvim-lua/plenary.nvim')

-- https://github.com/Julian/lean.nvim
Plug('Julian/lean.nvim')

vim.call('plug#end')
