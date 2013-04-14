source ~/.config/vim/vundle.vim

filetype on
filetype plugin on
filetype indent on


"
" general config
"
syntax on

set autoread
set backspace=indent,eol,start
set encoding=utf-8
set guicursor=a:blinkon0
set hidden
set history=1000
set laststatus=2
set lazyredraw
set mouse=a
set number
set ruler
set shell=/bin/zsh
set showcmd
set showmode
set title
set ttyfast
set visualbell

"
" map settings
"
let mapleader=","

"
" buffer settings
"
" return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" remember buffer info on close
set viminfo^=%

"
" search settings
"
set ignorecase
set smartcase
set incsearch
set hlsearch
set magic
set showmatch
set matchtime=3

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
" fold settings
"
set foldmethod=indent
map <leader>fi :setlocal foldmethod=indent<cr>
map <leader>fs :setlocal foldmethod=syntax<cr>
map <leader>fm :setlocal foldmethod=marker<cr>
map <leader>fd :setlocal foldmethod=diff<cr>

"
" other settings
"
let g:tex_flavor = 'latex'
let python_highlight_all = 1

"
" Mappings
"

" clear search buffer
nnoremap <leader>. :let @/=""<bar>echo "Search buffer cleared"<cr>
" toggle cursor line
nnoremap <leader>c :set cursorline!<bar>echo "Toggled cursorline"<cr>
" toggle tab highlights
nnoremap <leader>h :set list listchars=tab:\ \ ,trail:·<cr>
nnoremap <leader>H :set list listchars=tab:\»\-,trail:·<cr>
" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" fast save
nmap <leader>w :w!<cr>
" treat long lines as break lines
map j gj
map k gk
" multiple windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
" buffers
" switch to directory of current buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"
" Plugins
"

" Less-Cmd
let g:less_compress = 1

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
nnoremap <leader>tt :TagbarToggle<cr>
nnoremap <leader>tr :TagbarOpenAutoClose<cr>
let g:tagbar_autoclose = 0

" TaskList
map <leader>v <Plug>TaskList

" NeoSnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
imap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<tab>"
imap <expr><s-tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-p>" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

if has('conceal')
    set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" NeoComplCache
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_min_syntax_length = 3

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

inoremap <expr> <C-h> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr> <BS> neocomplcache#smart_close_popup() . "\<C-h>"
inoremap <expr> <C-y> neocomplcache#close_popup()
inoremap <expr> <C-e> neocomplcache#cancel_popup()

inoremap <expr> <C-g> neocomplcache#undo_completion()
inoremap <expr> <C-l> neocomplcache#complete_common_string()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

