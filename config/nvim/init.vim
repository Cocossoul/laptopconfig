call plug#begin()
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline' |
            \ Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'joshdick/onedark.vim'
Plug 'paulondc/vim-nerdtree-open-externally'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/tagbar'
Plug 'ibhagwan/fzf-lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'chipsenkbeil/distant'
Plug 'folke/trouble.nvim'
call plug#end()

syntax on
set cc=80
let NERDTreeMinimalUI=1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
lua require'lspconfig'.clangd.setup{}
lua require'trouble'.setup{}
colorscheme onedark
let g:airline_theme='transparent'
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
set termguicolors
nmap <C-F> :FzfLua 
nmap <C-N> :NERDTreeToggle<CR>
nmap <C-G> :!clang-format -i %<CR><CR>
au BufRead,BufNewFile *.pro set filetype=prolog
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufWinEnter,WinEnter term://* set mouse=a
autocmd BufLeave term://* stopinsert
autocmd BufLeave term://* set mouse=
