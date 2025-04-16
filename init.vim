" == Basic Settings ==
set nocompatible
set number    
set hidden
set tabstop=4
set shiftwidth=4
set smartindent
set wrap
set termguicolors
syntax on

" == Leader Key ==
let mapleader = " "

" == Basic Mappings ==
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" == Search ==
set ignorecase
set smartcase
set incsearch
set hlsearch

" == File Explorer ==
nnoremap <leader>e :Files<CR>

" == Plugins ==
call plug#begin('~/.vim/plugged')

" --- Navigation & UI ---
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'joshdick/onedark.vim'

" --- Language & LSP ---
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" --- Productivity ---
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" --- Syntax Highlighting ---
Plug 'sheerun/vim-polyglot'

" --- Autocomplete & Snippets ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'windwp/nvim-autopairs'

call plug#end()

" == Theme ==
colorscheme onedark

" == Auto Pairs Setup ==
lua << EOF
require("nvim-autopairs").setup()
EOF

" == Coc.nvim Settings ==
" Enable auto-complete on Enter and Tab like VSCode
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
" Tab only indents without interacting with snippets
inoremap <silent><expr> <TAB> CheckBackspace() ? "\<TAB>" : "\<TAB>"
" Shift-Tab to navigate previous suggestions (optional, you can remove this if not needed)
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" == Vim LSP Setup for Java ==
let g:lsp_servers = {}

" --- Java LSP ---
let g:lsp_servers['java'] = {
    \ 'command': '/home/jacob/nix/store/bsdpibrlbxxxvai24v2x793vpd9riqw1-jdt-language-server-1.40.0/bin/jdtls',
    \ 'args': ['-data', '~/workspace/jdtls']
    \ }


