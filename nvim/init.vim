call plug#begin()

" https://github.com/fxn/vim-monochrome
Plug 'fxn/vim-monochrome'

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" https://github.com/google/vim-codefmt
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" initialize plugin system
call plug#end()

colorscheme monochrome

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
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
