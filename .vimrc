execute pathogen#infect()
syntax on
filetype plugin indent on

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
call plug#end()

let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
nnoremap <silent> <C-f> :Files<CR>

let mapleader = ","
let g:mapleader = ","

nmap <leader>s :w!<cr>          " Fast save
nmap <leader>d :wq!<cr>         " Fast save/quit
nmap <leader>x :q!<cr>          " Fast quit (no save)

nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprevious<CR>
