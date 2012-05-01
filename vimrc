set nocompatible " no vi compatibility!

fun! SetupVAM()
  " see the vam install doc for this function and all of the comments I snipped out

  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  if !filereadable(vam_install_path.'/vim-addon-manager/.git/config')
     \&& 1 == confirm("Clone VAM into ".vam_install_path."?","&Y\n&N")
    call mkdir(vam_install_path, 'p')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(vam_install_path, 1).'/vim-addon-manager'
    exec 'helptags '.fnameescape(vam_install_path.'/vim-addon-manager/doc')
  endif

  call vam#ActivateAddons(['fugitive', 'github:vim-scripts/a.vim', 'github:fholgado/minibufexpl.vim',
        \ 'github:scrooloose/nerdtree', 'github:msanders/snipmate.vim', 'surround',
        \ 'repeat', 'github:vim-scripts/matchit.zip', 'rails', 'github:tpope/vim-haml', 'github:tpope/vim-cucumber',
        \ 'github:tpope/vim-bundler', 'abolish', 'rake', 'github:tpope/vim-rvm', 'Syntastic', 'Gundo', 'SuperTab_continued.',
        \ 'The_NERD_Commenter', 'github:vim-ruby/vim-ruby', 'tComment', 'EasyMotion', 'github:vim-scripts/c.vim', 'github:jimenezrick/vimerl'], {'auto_install' : 0})
endfun

call SetupVAM()

" some display options
set history=1000 " keep lots of commandline history
set ruler " always show mark position at the bottom
set showcmd " show the current command at the bottom
set autoread " automatically read file when it has been changed from the outside
set number " show line numbers in the left margin
set scrolloff=1 " start scrolling the screen when mark is 1 line away from the top/bottom edge to keep some context around
set hidden " allow unwritten buffer backgrounding

" disable all the bells!
set noerrorbells
set visualbell
set t_vb=

" shorten all the prompts!
set shortmess=aTI

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
set title " make the terminal window say vim

set nobackup " don't create backup files
set wildmenu " more menu completion

" indenting options
set smarttab " insert tabs at the beginning of the line according to context
set autoindent " automatic indentation
set smartindent " do smart indenting for stuff
" set copyindent " copy indentation from the previous line when a newline is inserted
set expandtab " only use spaces for tabs. Overrides copyindent

set backspace=indent,eol,start " allow backspacing over everything in insert mode

set ts=2
set sw=2
set sts=2

" TODO sections for future vimrc reorganization
" autocommands, for filetype changes and other settings
" visual, fonts and stuff, and disabling the mouse
" mappings, to make your life easier
" plugin settings: global (and other) variables to set things for various
" set options, for all the :set stuff

