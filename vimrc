source ~/.config/vim/neobundle.vim

filetype on
filetype plugin on
filetype indent on

set rtp+=~/.config/vim/vim/bundle/powerline/powerline/bindings/vim

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
set tags=./tags,tags;$HOME

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
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent

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

" remap arrow keys to window resize
noremap <up> <C-w>+
noremap <down> <C-w>-
noremap <left> 3<C-w>>
noremap <right> 3<C-w><

" magic regex
nnoremap / /\v
nnoremap ? ?\v

" fast save
nmap <leader>w :w!<cr>

" treat long lines as break lines
map j gj
map k gk

" multiple windows
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" buffers
" switch to directory of current buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"
" Plugins
"

" Less-Cmd
let g:less_compress = 1

" Gundo
nnoremap <leader>U <ESC>:GundoToggle<cr>
let g:gundo_preview_bottom = 1
let g:gundo_width = 30

" Fugitive
noremap <leader>g :Git
noremap <leader>gb :Gblame<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>gd :Gdiff<cr>
noremap <leader>gp :Git push<cr>
noremap <leader>gr :Gremove<cr>
noremap <leader>gs :Gstatus<cr>
noremap <leader>ga :Gwrite<cr>

" Tabularize
nmap <leader>a= :Tabularize /=<cr>
nmap <leader>a: :Tabularize /:<cr>
nmap <leader>a:: :Tabularize /:\zs<cr>
nmap <leader>a, :Tabularize /,<cr>

" Syntastic
set statusline+=%<%f\ %h%m%r
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*
set statusline+=%=%-14.(%l,%c%V%)\ %P
let g:syntastic_python_checker_args = '-E'

" TaskList
map <leader>v <Plug>TaskList

" NeoComplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
inoremap <expr><tab> pubvisible() ? "\<C-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"
inoremap <expr><C-h> neocomplete#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" let g:neocomplcache_enable_camel_case_completion = 1
" 
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

" NeoSnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"imap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<tab>"
"imap <expr><s-tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-p>" : "\<tab>"
"smap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

if has('conceal')
    set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

if executable('ag')
    let g:unite_source_grep_command = 'ag'
endif

function! s:unite_settings()
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

autocmd FileType unite call s:unite_settings()

nnoremap [unite] <Nop>
nmap <space> [unite]

nnoremap [unite]<space> :Unite -no-split -start-insert source<cr>
nnoremap [unite]f :Unite -no-split -start-insert file_rec/async<cr>
nnoremap [unite]g :Unite -no-split grep:.<cr>
nnoremap [unite]o :Unite -no-split -start-insert -auto-preview outline<cr>
nnoremap [unite]l :Unite -no-split -start-insert line<cr>
nnoremap [unite]t :Unite -no-split -auto-preview -start-insert tag<cr>
nnoremap [unite]b :Unite -no-split -quick-match buffer<cr>
nnoremap <leader>b :Unite -no-split buffer<cr>
nnoremap [unite]c :Unite colorscheme<cr>


" VimFiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
nnoremap <leader>n :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<cr>
nnoremap <leader>m :VimFilerExplorer<cr>

" numbertoggle

let g:NumberToggleTrigger="<C-u>"

" Fun Functions!

" toggle background color
function! ToggleBackgroundColor()
    if &background ==? 'dark'
        let &background = 'light'
    else
        let &background = 'dark'
    endif
endfunction
