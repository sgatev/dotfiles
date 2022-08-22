source ~/.dotfiles/nvim/plugins.vim

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

set number

set cursorline
