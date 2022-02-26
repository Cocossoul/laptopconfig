call plug#begin()
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline' |
            \ Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

set cc=80
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
lua require'lspconfig'.clangd.setup{}
let g:airline_theme='simple'
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
