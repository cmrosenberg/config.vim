"Extends minimal.vim

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-rooter'
Plug 'junegunn/seoul256.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/xoria256.vim'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'wellle/targets.vim'
Plug 'sjl/badwolf'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

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