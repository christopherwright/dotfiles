filetype off
call pathogen#infect()
call pathogen#helptags()
set nocompatible
syntax on
filetype plugin indent on

syn sync minlines=200
syn sync fromstart

set nocompatible      " Use vim defaults
set history=50        " Keep 50 lines of command history
set scrolloff=3       " Minimal number of lines to keep above/below cursor
set number            " Turn on line numbers
set showcmd           " Display incomplete commands
set vb                " Turn off loud beep
set noerrorbells
set vb t_vb=
set ignorecase        " Ignore case when searching
set backspace=indent,eol,start " Allows backspacing over these character types
set mouse=            " Disables console mouse-support


"
" Tabs, spaces and wrapping 
"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1


"
" Search
"
set incsearch         " Incremental searching
set hlsearch          " Highlight searches
" Press space to turn off highlighting and clear any message already
" displayed
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


"
" Backups 
"
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set backup                        " enable backups


"
" Syntax highlighting / color scheme
" 
syntax enable
colorscheme Tomorrow-Night


"
" File types
"
augroup myfiletypes
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,cucumber set ai sw=2 sts=2 et
  autocmd FileType coffee set ai sw=2 sts=2 et
  autocmd FileType javascript set ai sw=2 sts=2 et
  autocmd FileType xml set ai ts=8 sw=8 sts=8
  autocmd FileType xslt set ai ts=2 sw=2
  autocmd FileType vim set ai ts=2 sw=2
augroup END


"
" Status line
"
set laststatus=2                              " Always show the status line
set ruler                                     " Show the cursor position in status line
set title                                     " Show title in status line
set statusline=
set statusline+=%-3.3n\                       " buffer number
set statusline+=%f\                           " filename
set statusline+=%h%m%r%w                      " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}]  " file type
set statusline+=%=                            " right align remainder
set statusline+=0x%-8B                        " character value
set statusline+=%-14(%l,%c%V%)                " line, character
set statusline+=%<%P                          " file position


"
" Autocmd
"
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " Raw text editing
  autocmd BufRead *\.txt setlocal formatoptions=l
  autocmd BufRead *\.txt setlocal lbr
  autocmd BufRead *\.txt map j gj
  autocmd BufRead *\.txt map k gk
  autocmd BufRead *\.txt setlocal smartindent
  autocmd BufRead *\.txt setlocal spell spelllang=en_us

  " For all text files set 'textwidth' to 78 characters
  autocmd FileType text setlocal textwidth=78

  augroup END
  augroup mkd
    autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
  augroup END

else

  set autoindent    " always set autoindenting on

endif


"
" Remap / Custom key combos
"
" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

nmap <leader>s :w!<cr>          " Fast save
nmap <leader>d :wq!<cr>         " Fast save/quit
nmap <leader>x :q!<cr>          " Fast quit (no save)

nnoremap <silent> <C-n> :tabnext<CR>
nnoremap <silent> <C-p> :tabprevious<CR>

" Command-T opens selection in new tab by default.
let g:CommandTAcceptSelectionMap = "<C-t>"
let g:CommandTAcceptSelectionTabMap = "<CR>"

nmap <leader>1 :tab split<CR>:exec("tag ".expand("<cword>"))<CR> " Ctag in new tab
nmap <leader>2 :vsp <CR>:exec("tag ".expand("<cword>"))<CR> " Ctag in vsp
