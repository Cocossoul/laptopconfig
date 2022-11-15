call plug#begin()
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neovim/nvim-lspconfig'
"Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline' |
            \ Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'joshdick/onedark.vim'
"Plug 'paulondc/vim-nerdtree-open-externally'
Plug 'airblade/vim-gitgutter'
Plug 'ibhagwan/fzf-lua'
Plug 'kyazdani42/nvim-web-devicons'
"Plug 'xolox/vim-misc'
Plug 'folke/trouble.nvim'
"Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
"Plug 'nvim-zh/colorful-winsep.nvim'
Plug 'ggandor/leap.nvim'
"Plug 'preservim/vim-pencil'
call plug#end()

syntax on
set cc=80
let NERDTreeMinimalUI=1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 1
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Lsp config
lua require'lspconfig'.clangd.setup{}
lua require'lspconfig'.rust_analyzer.setup{}
lua require'lspconfig'.gopls.setup{}
lua require'trouble'.setup{}
lua require'toggle_lsp_diagnostics'.init()

colorscheme onedark
let g:airline_theme='transparent'
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
set termguicolors
let g:tagbar_width=20
nmap <C-F> :FzfLua grep_project<CR>
nmap <C-N> :NERDTreeToggle<CR>
nmap <C-B> :TagbarToggle<CR>
nmap <C-G> :!clang-format -i %<CR><CR>
nmap <C-T> :tabnew<CR>:terminal<CR>i
au BufRead,BufNewFile *.pro set filetype=prolog
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufWinEnter,WinEnter term://* set mouse=a
autocmd BufLeave term://* stopinsert
autocmd BufLeave term://* set mouse=
tnoremap <M-q> <C-\><C-n>
let g:airline_powerline_fonts = 1
set laststatus =3
autocmd TermOpen * :DisableWhitespace "Fix for whitespace in term

lua require('config')

"autocmd BufNewFile,BufRead *.epinews set filetype=epita_news
"let g:pencil#textwidth = 72
"filetype plugin on
"augroup pencil
"  autocmd!
"  autocmd FileType epita_news call pencil#init({'wrap': 'hard', 'autoformat': 1})
"augroup END
