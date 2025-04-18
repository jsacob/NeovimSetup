" == Basic Settings ==
set nocompatible
set number    
set hidden
set tabstop=4
set shiftwidth=4
set smartindent
set wrap
set termguicolors
set clipboard+=unnamedplus
syntax on

" == Leader Key ==
let mapleader = " "

" == Basic Mappings ==
nnoremap <leader>w :w<CR>
nnoremap <leader>q :x<CR>
nnoremap <leader>f :%s/
nnoremap <leader>h <Plug>MarkdownPreview 
nnoremap <leader>x :q!<CR>
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
Plug 'dasupradyumna/midnight.nvim'
Plug 'tanvirtin/monokai.nvim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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

" == Treesitter Setup ==
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "java" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF

" == Theme ==
colorscheme monokai

hi Normal guibg=#272822

set guifont=Source\ Code\ Pro:h14

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
