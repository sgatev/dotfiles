vim.cmd [[packadd packer.nvim]]

return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim'

  -- https://www.nordtheme.com
  use 'gbprod/nord.nvim'

  -- https://github.com/itchyny/lightline.vim
  use 'itchyny/lightline.vim'

  -- https://github.com/google/vim-codefmt
  use 'google/vim-maktaba'
  use 'google/vim-codefmt'
  use 'google/vim-glaive'

  -- https://github.com/nvim-treesitter/nvim-treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = 'TSUpdate' }

  -- https://github.com/nvim-telescope/telescope.nvim
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.4' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- https://github.com/hrsh7th/nvim-cmp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- https://github.com/easymotion/vim-easymotion
  use 'easymotion/vim-easymotion'
  use 'ggandor/leap.nvim'

  -- https://github.com/mg979/vim-visual-multi
  use 'mg979/vim-visual-multi'

  -- https://github.com/RRethy/vim-illuminate
  use 'RRethy/vim-illuminate'

  -- https://github.com/folke/which-key.nvim
  use 'folke/which-key.nvim'

  -- https://github.com/folke/noice.nvim
  use 'MunifTanjim/nui.nvim'
  use 'folke/noice.nvim'

  -- https://github.com/ziglang/zig.vim
  use 'ziglang/zig.vim'

  -- https://github.com/stevearc/oil.nvim
  use 'stevearc/oil.nvim'

  -- https://github.com/alexghergh/nvim-tmux-navigation
  use 'alexghergh/nvim-tmux-navigation'

  -- https://github.com/lewis6991/gitsigns.nvim
  use 'lewis6991/gitsigns.nvim'

  -- https://github.com/bazelbuild/vim-bazel
  use 'bazelbuild/vim-bazel'

  -- https://github.com/sgatev/nvim-lucid
  use 'sgatev/nvim-lucid'

  -- https://github.com/epwalsh/obsidian.nvim
  use 'epwalsh/obsidian.nvim'
end,
config = {
  display = {
    open_fn = function()
      local result, win, buf = require('packer.util').float {
        border = {
          { '╭', 'FloatBorder' },
          { '─', 'FloatBorder' },
          { '╮', 'FloatBorder' },
          { '│', 'FloatBorder' },
          { '╯', 'FloatBorder' },
          { '─', 'FloatBorder' },
          { '╰', 'FloatBorder' },
          { '│', 'FloatBorder' },
        },
      }
      vim.api.nvim_win_set_option(win, 'winhighlight', 'NormalFloat:Normal')
      return result, win, buf
    end,
  }
}})
