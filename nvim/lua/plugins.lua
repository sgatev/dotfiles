vim.call('plug#begin')

local Plug = vim.fn['plug#']

-- https://www.nordtheme.com
Plug 'gbprod/nord.nvim'

-- https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

-- https://github.com/google/vim-codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

-- https://github.com/nvim-treesitter/nvim-treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })

-- https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.4' })
Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do'] = 'make' })

-- https://github.com/hrsh7th/nvim-cmp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

-- https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'
Plug 'ggandor/leap.nvim'

-- https://github.com/mg979/vim-visual-multi
Plug 'mg979/vim-visual-multi'

-- https://github.com/RRethy/vim-illuminate
Plug 'RRethy/vim-illuminate'

-- https://github.com/folke/which-key.nvim
Plug 'folke/which-key.nvim'

-- https://github.com/folke/noice.nvim
Plug 'MunifTanjim/nui.nvim'
Plug 'folke/noice.nvim'

-- https://github.com/ziglang/zig.vim
Plug 'ziglang/zig.vim'

-- https://github.com/stevearc/oil.nvim
Plug 'stevearc/oil.nvim'

-- https://github.com/alexghergh/nvim-tmux-navigation
Plug 'alexghergh/nvim-tmux-navigation'

-- https://github.com/lewis6991/gitsigns.nvim
Plug 'lewis6991/gitsigns.nvim'

-- https://github.com/bazelbuild/vim-bazel
Plug 'bazelbuild/vim-bazel'

-- https://github.com/sgatev/nvim-lucid
Plug 'sgatev/nvim-lucid'

-- https://github.com/epwalsh/obsidian.nvim
Plug 'epwalsh/obsidian.nvim'

-- https://github.com/echasnovski/mini.nvim
Plug 'echasnovski/mini.nvim'

vim.call('plug#end')
