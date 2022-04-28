"Extends minimal.vim

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-rooter'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'dag/vim-fish'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'rust-lang/rust.vim'
Plug 'sjl/badwolf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/xoria256.vim'
Plug 'wellle/targets.vim'

call plug#end()

au BufEnter *.tsx set ft=typescript | nnoremap <localleader>p :Prettier<cr>
au BufEnter *.js nnoremap <localleader>p :Prettier<cr>
au BufEnter *.ts nnoremap <localleader>p :Prettier<cr>
au BufEnter *.css nnoremap <localleader>p :Prettier<cr>
au BufEnter *.html nnoremap <localleader>p :Prettier<cr>
au BufEnter *.md nnoremap <localleader>p :Prettier<cr>

au BufEnter *.py nnoremap <localleader>p :%!black -q -<cr>
au BufEnter *.go nnoremap <localleader>p :%!gofmt<cr>

colo dracula

set belloff=all

"fzf.vim plugins
nnoremap <leader>s :Rg<cr>
nnoremap <leader>f :Files<cr>
nnoremap <localleader>l :Buffers<cr>
nnoremap <localleader>g :BCommits<cr>

set splitright

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


"Check for changes to file when entering buffer change
au BufEnter * :checktime

"Check for changes to file if cursor has been inactive for 750 ms
set updatetime=750
au CursorHold,CursorHoldI * :checktime
