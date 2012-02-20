call pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible      " Use vim defaults
set history=50        " Keep 50 lines of command history
set tabstop=2         " Number of space of tab character
set shiftwidth=4      " Number of space to auto-indent
set expandtab         " Tabs are converted to spaces
set scrolloff=3       " Minimal number of lines to keep above/below cursor
set number            " Turn on line numbers
set showcmd           " Display incomplete commands
set vb                " Turn off loud beep
set noerrorbells
set vb t_vb=
set ignorecase        " Ignore case when searching
set backspace=indent,eol,start " Allows backspacing over these character types
set mouse=            " Disables console mouse-support

set autoindent        " Copy indent from current line when starting new line
"set smartindent       " Attempts to indent appropiately near curly braces
"set cindent           " Get amount of indent according to C-indenting rules

"
" Search
"
set incsearch         " Incremental searching
set hlsearch          " Highlight searches
" Press space to turn off highlighting and clear any message already
" displayed
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"
" Syntax highlighting / color scheme
" 
if &term =~ "xterm"
  "256 color --
  let &t_Co=256
  " Restore screen after quitting
  set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8
  if has("terminfo")
    let &t_Sf="\ESC[3%p1%dm"
    let &t_Sb="\ESC[4%p1%dm"
  else
    let &t_Sf="\ESC[3%dm"
    let &t_Sb="\ESC[4%dm"
  endif
endif

syntax on
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

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
