vim.call('plug#begin')

local Plug = vim.fn['plug#']

-- https://www.nordtheme.com
Plug 'arcticicestudio/nord-vim'

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
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.0' })
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

-- https://github.com/mg979/vim-visual-multi
Plug 'mg979/vim-visual-multi'

-- https://github.com/RRethy/vim-illuminate
Plug 'RRethy/vim-illuminate'

vim.call('plug#end')
