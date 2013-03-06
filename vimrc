set nocompatible

"
" load pathogen bundles
"
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

"
" global settings
"
filetype plugin indent on
syntax on

"
" general config
"
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set guicursor=a:blinkon0
set hidden
set history=1000
set laststatus=2
set lazyredraw
set magic
set matchtime=3
set mouse=a
set number
set ruler
set shell=/bin/zsh
set showcmd
set showmatch
set showmode
set title
set ttyfast
set visualbell

"
" search settings
"
set gdefault
set ignorecase
set incsearch
set hlsearch
set smartcase

set wildmenu
set wildmode=list:longest

set completeopt=longest,menuone

"
" disable backup files
"
set noswapfile
set nobackup
set nowritebackup

"
" color settings
"
set background=dark
colorscheme moria

"
" indent settings
"
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4

set list listchars=tab:\»\-,trail:·

"
" scroll settings
"
set scrolloff=8

"
" highlighting and word wrap settings
"
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
highlight ColorColumn ctermbg=red
highlight CursorLine cterm=NONE ctermfg=white ctermbg=green
highlight CursorColumn cterm=NONE ctermbg=red

"
" other settings
"
let g:tex_flavor = 'latex'
let python_highlight_all = 1

"
" Mappings
"

let mapleader=","

" clear search buffer
nnoremap <leader>. :let @/=""<bar>echo "Search buffer cleared"<cr>
" toggle cursor line
nnoremap <leader>c :set cursorline!<bar>echo "Toggled cursorline"<cr>
" toggle tab highlights
nnoremap <leader>h :set list listchars=tab:\ \ ,trail:·<cr>
nnoremap <leader>H :set list listchars=tab:\»\-,trail:·<cr>

"
" Plugins
"

" Conque
let g:ConqueTerm_PyVersion = 3
let g:ConqueTerm_FastMode = 1

" Gundo
nnoremap <leader>g <ESC>:GundoToggle<cr>
let g:gundo_preview_bottom = 1
let g:gundo_width = 30

" NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>

" Syntastic
set statusline+=%<%f\ %h%m%r
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*
set statusline+=%=%-14.(%l,%c%V%)\ %P
let g:syntastic_python_checker_args = '-E'

" Tagbar
nnoremap <leader>t :TagbarToggle<cr>
nnoremap <leader>r :TagbarOpenAutoClose<cr>
let g:tagbar_autoclose = 1

" TaskList
map <leader>v <Plug>TaskList

