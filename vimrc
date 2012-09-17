
" load pathogen bundles
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has('gui_running')
    set guioptions-=rT
    set guifont=Courier\ New
    colorscheme torte
endif

" standard stuff
filetype plugin indent on
syntax on

set nocompatible
set modeline
set modelines=0

" tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" color settings
set background=dark
colorscheme moria

set encoding=utf-8
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell

set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set shell=/bin/bash
" set lazyredraw
set matchtime=3

set title

set mouse=a

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

set wrap
set textwidth=79
set formatoptions=qrn1
hi ColorColumn ctermbg=red
set colorcolumn=80

let mapleader=","

" TODO: take command line args
map <buffer> <S-e> :w<cr>:!/usr/bin/env python % <cr>

map <leader>; :let @/=""<bar>echo "Search buffer cleared"<cr>

nnoremap <F2> :set nonumber!<cr>:set foldcolumn=0<cr>

noremap <C-J> gj
noremap <C-K> gk

"
" PLUGIN configurations
" 

" NERDTree
nnoremap <C-n> :NERDTreeToggle<cr>

" Tagbar
nnoremap <leader>l <ESC>:TagbarToggle<cr>
inoremap <leader>l <ESC>:TagbarToggle<cr>

" Gundo
nnoremap <leader>g <ESC>:GundoToggle<cr>
let g:gundo_preview_bottom = 1
let g:gundo_width = 30

" Conque
let g:ConqueTerm_PyVersion = 3
let g:ConqueTerm_FastMode = 1

" miniBufExpl
" let g:miniBufExplMapWindowNavVim = 1
" let g:miniBufExplMapWindowNavArrows = 1
" let g:miniBufExplMapCTabSwitchBufs = 1
" let g:miniBufExplModSelTarget = 1

" Syntaxflakes
let python_highlight_all = 1

" obviousmode
let g:obviousModeInsertHi = 'ctermbg=3'
let g:obviousModeCmdwinHi = 'ctermbg=22'
let g:obviousModeModifiedCurrentHi = 'ctermbg=2'
let g:obviousModeModifiedNonCurrentHi = 'ctermbg=30'
let g:obviousModeModifiedVertSplitHi = 'ctermbg=22'

" syntastic
set statusline+=%<%f\ %h%m%r
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*
set statusline+=%=%-14.(%l,%c%V%)\ %P

" vim-LaTeX
let g:tex_flavor = 'latex'
" let b:doneTexCompiler = 1 " disable vim-latex compiler
let g:Tex_CompileRule_pdf = 'make'
" let g:syntastic_error_symbol='✗'

