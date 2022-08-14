call plug#begin()

" https://www.nordtheme.com
Plug 'arcticicestudio/nord-vim'

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" https://github.com/google/vim-codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" initialize plugin system
call plug#end()

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
