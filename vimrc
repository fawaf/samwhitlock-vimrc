" Sam Whitlock's vimrc

set nocompatible " no vi compatibility!
set backspace=indent,eol,start " allow backspacing over everything in insert mode

runtime bundle/pathogen/autoload/pathogen.vim

filetype off
call pathogen#infect()
call pathogen#helptags() " Generate the helptags. Comment this if startup time is critical

" some display options
set history=50 " always keep 50 lines of commandline history
set ruler " always show mark position at the bottom
set showcmd " show the current command at the bottom
set autoread " automatically read file when it has been changed from the outside
set number " show line numbers in the left margin
set scrolloff=1 " start scrolling the screen when mark is 1 line away from the top/bottom edge to keep some context around
set hidden " allow unwritten buffer backgrounding

" disable the bells
set noerrorbells
set novisualbell
set t_vb=

" turn hlsearch and syntax on if it will show up
if &t_Co > 1
        syntax enable
endif

if &t_Co > 2 || has("gui_running")
  set hlsearch
else
    set nohlsearch
endif

filetype on " Enable filetype detection
filetype indent on " Enable filetype-specific indentation
filetype plugin on " Enable filetype-specific plugins

" searching options
set incsearch " incremental search
set ignorecase " ignore case when searching
set smartcase " BUT don't ignore case when search contains captial letters

set nobackup " don't create backup files
set wildmenu " more menu completion

" indenting options
set smarttab " insert tabs at the beginning of the line according to context
set autoindent " automatic indentation
set smartindent " do smart indenting for stuff
" set copyindent " copy indentation from the previous line when a newline is inserted
set expandtab " only use spaces for tabs. Overrides copyindent
set ts=4
set sw=4
set sts=4

