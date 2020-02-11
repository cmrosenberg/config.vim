" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.2
"
set nocompatible

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 || v:version == 704 && !has('patch276'))
  set shell=/usr/bin/env\ bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:
set list


let mapleader = ","
let maplocalleader = ";"

" Switch to auxillary buffer quickly
nnoremap <leader>b :b#<cr>

"Map jk to Escape for easier mode switching"
inoremap jk <esc>


set expandtab

" Extremely crude mappings for timestamps.
:nnoremap <leader>t o<Esc>"=strftime("%Y, Week %V, %A %B %d at %X %Z: ")<C-M>pA
:nnoremap <leader>T O<Esc>"=strftime("%Y, Week %V, %A %B %d at %X %Z: ")<C-M>pA

:function Protocolfile()
       :execute ("edit " . $HOME . "/lasting/write/protocol/"  . strftime("%Y-%m-%d") . ".md")
:endfunction

:function Stufffile()
       :execute ("edit " . $HOME . "/lasting/stuff.txt")
:endfunction

:inoremap jk <esc>


:nnoremap <leader>p :call Protocolfile()<cr>
:nnoremap <leader>s :call Stufffile()<cr>

set hidden
set list
set noswapfile
set nobackup

set statusline=%<%f\ \| "Show filename relative to working directory
set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}\ \|      "Encoding
set statusline+=\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=\%h%m%r%=%-14.(%l,%c%V%)\ %P "Rest of the standard options


if exists("&colorcolumn")
    highlight ColorColumn ctermbg=red
    call matchadd('ColorColumn', '\%81v', 100)
endif

if executable("par")
    set formatprg=par
endif

au BufEnter *.txt   set tw=79 | set formatoptions+=t
au BufEnter *.tex   set tw=79 | set formatoptions+=t
au BufEnter *.md   set tw=79 | set formatoptions+=t

au BufEnter *.go set nosmarttab | set noexpandtab | set nolist
au BufEnter *.go nnoremap <leader>f :%!gofmt<cr>

au BufEnter *.py nnoremap <leader>f :%!black -q -<cr>

if has('persistent_undo')
        " From https://alok.github.io/2018/10/17/underrated-vim-option-undofile-and-undodir/
    silent !mkdir -p ~/.local/share/vim/undo > /dev/null 2>&1
    set undodir=~/.local/share/vim/undo
    set undofile
endif

set showcmd

colo desert
