call plug#begin()

"Color schemes
Plug 'altercation/vim-colors-solarized'
Plug 'jonathanfilip/vim-lucius'
Plug 'junegunn/seoul256.vim'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/xoria256.vim'
Plug 'NLKNguyen/papercolor-theme'

"Awesomeness from Junegunn Choi
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Awesomeness from Tim Pope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-tbone'
"Plug 'tpope/vim-vinegar'

Plug 'pangloss/vim-javascript'

Plug 'scrooloose/syntastic'

Plug 'lervag/vimtex'

Plug 'wellle/targets.vim' "Provides aditional targets plugins
Plug 'vim-scripts/indentpython.vim'

"Consider adding https://github.com/sheerun/vim-polyglot
"https://github.com/moll/vim-node
"https://github.com/flowtype/vim-flow
"https://github.com/rhysd/vim-grammarous
"https://github.com/mhinz/vim-signify

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       PLUGIN CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType java let b:dispatch = 'javac %'
autocmd FileType tex set commentstring=\%%s
autocmd FileType sml setlocal commentstring=(*%s*)

runtime! ftplugin/man.vim

let g:ansible_options = {'ignore_blank_lines': 0}


let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out])
  else
    call system(join(l:cmd + [line('.'), shellescape(l:out)], ' '))
  endif
endfunction

set foldmethod=expr
set foldexpr=vimtex#fold#level(v:lnum)
set foldtext=vimtex#fold#text()
set nofoldenable
