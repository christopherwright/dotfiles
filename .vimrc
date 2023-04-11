execute pathogen#infect()
syntax on
filetype plugin indent on

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

nnoremap <silent> <C-f> :Files<CR>
