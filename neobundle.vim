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

NeoBundle 'tpope/vim-abolish'
NeoBundle 'vim-scripts/minibufexplorerpp'
NeoBundle 'vim-scripts/c.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'godlygeek/tabular'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'shemerey/vim-project'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/IndexedSearch'
NeoBundle 'ffomezolam/vim-less-cmd'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'techlivezheng/tagbar-phpctags'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-scripts/TaskList.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'Shougo/vimproc.vim', {
    \ 'build': {
    \   'mac': 'make -f make_mac.mak',
    \   'unix': 'make -f make_unix.mak',
    \ },
    \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/unite-outline'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
