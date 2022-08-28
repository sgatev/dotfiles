source ~/.dotfiles/nvim/plugins.vim

let mapleader = ","

colorscheme nord

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

filetype plugin indent on

" on pressing tab, insert 2 spaces
set expandtab

" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

set clipboard=unnamed

set termguicolors

set number

set cursorline

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
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
EOF
