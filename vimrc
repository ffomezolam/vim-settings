" vim:fdm=marker

source ~/.config/vim/neobundle.vim


"           _   _   _
"  ___  ___| |_| |_(_)_ __   __ _ ___
" / __|/ _ \ __| __| | '_ \ / _` / __|
" \__ \  __/ |_| |_| | | | | (_| \__ \
" |___/\___|\__|\__|_|_| |_|\__, |___/
"                           |___/
" settings {{{

" general {{{
set t_Co=256
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set guicursor=a:blinkon0
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
" }}}
" filetypes {{{
filetype on
filetype plugin on
filetype indent on
syntax on
" }}}
" mappings {{{
let mapleader=","
" }}}
" buffers {{{
" hide buffer instead of delete when abandoned
set hidden
" remove trailing whitespace on write
autocmd BufReadPost * :silent! %s/\s\+$//
" return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
" remember buffer info on close
set viminfo^=%
" }}}
" searching {{{
set ignorecase
set smartcase
set incsearch
set hlsearch
set magic
set showmatch
set matchtime=3
" }}}
" menus {{{
set wildmenu
set wildmode=list:longest
set completeopt=longest,menuone
" }}}
" backups {{{
set noswapfile
set nobackup
set nowritebackup
" }}}
" color {{{
set background=dark
colorscheme desert256
highlight Pmenu ctermbg=238 ctermfg=255

highlight SignColumn ctermbg=0

highlight ColorColumn ctermbg=grey
highlight CursorLine cterm=NONE ctermfg=white ctermbg=green
highlight CursorColumn cterm=NONE ctermbg=grey
" }}}
" indenting {{{
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
" }}}
" blank spaces {{{
set list listchars=tab:\»\-,trail:·
" }}}
" scrolling {{{
set scrolloff=8
" }}}
" word wrap {{{
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80
" }}}
" folding {{{
set foldmethod=indent
" }}}

" End Settings }}}

"        _             _
"  _ __ | |_   _  __ _(_)_ __  ___
" | '_ \| | | | |/ _` | | '_ \/ __|
" | |_) | | |_| | (_| | | | | \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/
" |_|            |___/
" Plugins {{{

" delimitMate {{{
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
" }}}

" Less-Cmd
let g:less_compress = 1

let g:tex_flavor = 'latex'
let python_highlight_all = 1

au FileType javascript call JavaScriptFold()

" Airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
" }}}
" Emmet {{{
""" enable just for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" }}}
" Gundo {{{
let g:gundo_preview_bottom = 1
let g:gundo_width = 30
" }}}
" incsearch {{{
let g:incsearch#auto_nohlsearch = 1
" }}}
" NeoComplete and NeoSnippet {{{
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

imap <expr><CR> pumvisible() ? (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : neocomplete#cancel_popup()) : '<Plug>delimitMateCR'
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"
inoremap <expr><C-h> neocomplete#smart_close_popup() . "\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup() . "\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)


autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

if has('conceal')
    set conceallevel=2 concealcursor=i
endif

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
" }}}
" Syntastic {{{
"set statusline+=%<%f\ %h%m%r
"set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%*
"set statusline+=%=%-14.(%l,%c%V%)\ %P
let g:syntastic_python_checker_args = '-E'
" }}}
" Unite {{{
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

if executable('ag')
    let g:unite_source_grep_command = 'ag'
endif

function! s:unite_settings()
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

autocmd FileType unite call s:unite_settings()
" }}}
" VimFiler {{{
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
" }}}
" VimShell {{{
let g:vimshell_prompt = $USER . "> "
"let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":^")'
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":^") . ">", "\\[]()?! ") . " "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
nnoremap <leader>v :VimShellPop<cr>
" }}}

" End Plugins }}}

"
"  _ __ ___   __ _ _ __  _ __ (_)_ __   __ _ ___
" | '_ ` _ \ / _` | '_ \| '_ \| | '_ \ / _` / __|
" | | | | | | (_| | |_) | |_) | | | | | (_| \__ \
" |_| |_| |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
"                 |_|   |_|            |___/
" Mappings {{{

" Up {{{
noremap <up> <C-w>+
" }}}
" Down {{{
noremap <down> <C-w>-
" }}}
" Left {{{
noremap <left> 3<C-w>>
" }}}
" Right {{{
noremap <right> 3 <C-w><
" }}}
" [ {{{
" }}}
" ] {{{
" }}}
" . {{{
""" clear search buffer
nnoremap <leader>. :let @/=""<bar>echo "Search buffer cleared"<cr>
" }}}
" , {{{
" }}}
" < {{{
" }}}
" > {{{
" }}}
" ; {{{
" }}}
" / (Search and Replace) {{{
""" PLUGIN incsearch.vim
map / <Plug>(incsearch-forward)\v
""" magic replace
nnoremap <leader>/s :s/\v
" }}}
" ? (Search) {{{
""" PLUGIN incsearch.vim
map ? <Plug>(incsearch-backward)\v
" }}}
" space (Unite) {{{
nnoremap [unite] <Nop>
nmap <space> [unite]

""" Unite general search
nnoremap [unite]<space> :Unite -no-split -start-insert source<cr>
" }}}
" a {{{
" Tabularize
nmap <leader>a= :Tabularize /=<cr>
nmap <leader>a: :Tabularize /:<cr>
nmap <leader>a:: :Tabularize /:\zs<cr>
nmap <leader>a, :Tabularize /,<cr>
" }}}
" b {{{
""" Unite buffer quick match
nnoremap [unite]b :Unite -no-split -quick-match -no-cursor-line buffer<cr>
""" Close buffer and select previous one
nnoremap <leader>bq :bp <BAR> bd #<cr>
""" List buffers
nnoremap <leader>bl :ls<cr>
""" Previous buffer
nnoremap <silent> <C-B> :bprevious<cr>
""" Next buffer
nnoremap <silent> <C-b> :bnext<cr>
" }}}
" c {{{
""" PLUGIN NERDCommenter
""" switch to directory of current buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>
""" Unite colorscheme
nnoremap [unite]c :Unite colorscheme<cr>
" }}}
" d {{{
" }}}
" e {{{
""" edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" }}}
" f {{{
""" Unite file search
nnoremap [unite]f :Unite -no-split -start-insert file_rec/async<cr>
" }}}
" g {{{
""" Fugitive
noremap <leader>g :Git
noremap <leader>gb :Gblame<cr>
noremap <leader>gc :Gcommit<cr>
noremap <leader>gd :Gdiff<cr>
noremap <leader>gp :Git push<cr>
noremap <leader>gr :Gremove<cr>
noremap <leader>gs :Gstatus<cr>
noremap <leader>ga :Gwrite<cr>
""" Unite grep
nnoremap [unite]g :Unite -no-split grep:.<cr>
" }}}
" h {{{
""" select window left
map <C-h> <C-w>h
" }}}
" i {{{
" }}}
" j {{{
""" select window below
map <C-j> <C-w>j
""" ignore line wrapping
map j gj
" }}}
" k {{{
""" select window above
map <C-k> <C-w>k
""" ignore line wrapping
map k gk
""" PLUGIN TaskList
map <leader>k <Plug>TaskList
" }}}
" l {{{
""" select window right
map <C-l> <C-w>l
""" toggle cursor line
nnoremap <silent> <leader>l :set cursorline!<cr>jk
""" Unite line search
nnoremap [unite]l :Unite -no-split -start-insert line<cr>
" }}}
" m {{{
" }}}
" n {{{
""" VimFiler
nnoremap <leader>n :VimFilerExplorer<cr>
""" toggle line number style (numbertoggle plugin)
let g:NumberToggleTrigger="<C-n>"
""" PLUGIN incsearch.vim
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" }}}
" o {{{
""" Unite doc outline
nnoremap [unite]o :Unite -no-split -start-insert -auto-preview outline<cr>
" }}}
" p {{{
" }}}
" q {{{
" }}}
" r {{{
""" redraw buffer
noremap <silent> <C-r> :redraw!<cr>
" }}}
" s {{{
""" source vimrc
nnoremap <leader>sv :source $MYVIRMC<cr>
""" Unite tasklist
nnoremap [unite]s :Unite -no-split tasklist<cr>
" }}}
" t {{{
""" Unite tags
nnoremap [unite]t :Unite -no-split -auto-preview -start-insert tag<cr>
" }}}
" u {{{
" Gundo
nnoremap <leader>u <esc>:GundoToggle<cr>
" make word uppercase
inoremap <C-U> <esc>mZviwU`Zli
nnoremap <C-U> mZviwU`Z
" make word lowercase
inoremap <C-u> <esc>mZviwu`Zli
nnoremap <C-u> mZviwu`Z
" Unite buffer
nnoremap [unite]u :Unite -no-split buffer<cr>
" }}}
" v {{{
" }}}
" w {{{
""" fast save
nmap <leader>w :w!<cr>:redraw!<cr>
" }}}
" x {{{
" }}}
" y {{{
""" PLUGIN emmet
""" redo
nnoremap y :redo<cr>
" }}}
" z {{{
" }}}

" End Mappings }}}

"        _     _                    _       _   _
"   __ _| |__ | |__  _ __ _____   _(_) __ _| |_(_) ___  _ __  ___
"  / _` | '_ \| '_ \| '__/ _ \ \ / / |/ _` | __| |/ _ \| '_ \/ __|
" | (_| | |_) | |_) | | |  __/\ V /| | (_| | |_| | (_) | | | \__ \
"  \__,_|_.__/|_.__/|_|  \___| \_/ |_|\__,_|\__|_|\___/|_| |_|___/
" Abbreviations {{{
iabbrev @@ ffomezolam@gmail.com
" }}}

"   __                  _   _
"  / _|_   _ _ __   ___| |_(_) ___  _ __  ___
" | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
" |  _| |_| | | | | (__| |_| | (_) | | | \__ \
" |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
" Functions {{{

" toggle background color
function! ToggleBackgroundColor()
    if &background ==? 'dark'
        let &background = 'light'
    else
        let &background = 'dark'
    endif
endfunction

" End Functions }}}
