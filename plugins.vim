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

"Awesomeness from Tim Pope
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-tbone'
Plug 'tpope/vim-vinegar'


Plug 'pangloss/vim-javascript'

Plug 'scrooloose/syntastic'

Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'wellle/targets.vim'

Plug 'ctrlpvim/ctrlp.vim'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       PLUGIN CONFIGURATION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_mode_map = {'mode': 'active'}
let g:syntastic_javascript_checkers = ['jshint']

autocmd FileType java let b:dispatch = 'javac %'
autocmd FileType tex let b:dispatch = 'pdflatex % -file-line-error'

autocmd FileType tex set commentstring=\%%s
autocmd FileType sml setlocal commentstring=(*%s*)

let g:LatexBox_Folding=1

runtime! ftplugin/man.vim

let g:ansible_options = {'ignore_blank_lines': 0}
