call plug#begin()

Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'tpope/vim-commentary'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'

call plug#end()


"------------Start Python PEP 8 stuff----------------
"Copied from https://github.com/j1z0/vim-config/blob/master/vimrc
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
inoremap jk <esc>
set bg=dark

set hidden

if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
endif

let mapleader = ","
let maplocalleader = ";"

"Make it easier to follow links when reading help
nnoremap <leader><cr> <c-]>

if executable("par")
    set formatprg=par
endif

let g:LatexBox_Folding=1

" autocmd FileType tex :Goyo
" autocmd FileType tex :Limelight
autocmd FileType tex set foldenable
autocmd FileType tex set foldlevel=1
autocmd FileType tex set commentstring=\%%s

set list
set hidden
colo desert
set visualbell t_vb=
set noswapfile
set ttyfast
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
