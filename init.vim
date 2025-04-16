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
nnoremap <leader>q :x<CR>
nnoremap <leader>f :%s/
" == Search =
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
Plug 'dasupradyumna/midnight.nvim'

" --- Language & LSP (Coc only) ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" --- Productivity ---
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" --- Syntax Highlighting ---
Plug 'sheerun/vim-polyglot'

" --- Autocomplete & Autopairs ---
Plug 'windwp/nvim-autopairs'

call plug#end()

" == Theme ==
colorscheme onedark
hi Normal guibg=#000000  

" == Auto Pairs Setup ==
lua << EOF
require("nvim-autopairs").setup()
EOF

" == Coc.nvim Settings ==
" Confirm completion with Enter (already works for you)
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" Tab only indents without interacting with snippets
inoremap <silent><expr> <TAB> CheckBackspace() ? "\<TAB>" : "\<TAB>"
" Shift-Tab to navigate previous suggestions (optional)
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

