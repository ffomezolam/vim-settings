if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" runtime / syntax
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'groenewege/vim-less'
NeoBundle 'tpope/vim-haml'
NeoBundle 'xsbeats/vim-blade'
NeoBundle 'vim-scripts/c.vim'
NeoBundle 'tpope/vim-git'
NeoBundle 'othree/html5-syntax.vim'
NeoBundle 'ffomezolam/vim-less-cmd'
NeoBundle 'plasticboy/vim-markdown'

" interface
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/vimproc.vim', {
    \ 'build': {
    \   'mac': 'make -f make_mac.mak',
    \   'unix': 'make -f make_unix.mak',
    \ },
    \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'flazz/vim-colorschemes'

" utilities
NeoBundle 'tpope/vim-abolish'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'shemerey/vim-project'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/IndexedSearch'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-scripts/TaskList.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'marijnh/tern_for_vim', {
    \ 'build': {
    \   'mac': 'npm install',
    \   'unix': 'npm install',
    \ },
\ }

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
