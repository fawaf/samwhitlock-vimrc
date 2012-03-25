set nocompatible " no vi compatibility!

fun! SetupVAM()
          " set advanced options like this:
          " let g:vim_addon_manager = {}
          " let g:vim_addon_manager['key'] = value

          " YES, you can customize this vam_install_path path and everything
          " still works!
          let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
          exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

          " * unix based os users may want to use this code checking out VAM
          " * windows users want to use http://mawercer.de/~marc/vam/index.php
          " to fetch VAM, VAM-known-repositories and the listed plugins
          " without having to install curl, unzip, git tool chain first
          " -> BUG [4] (git-less installation)
          if !filereadable(vam_install_path.'/vim-addon-manager/.git/config')
             \&& 1 == confirm("Clone VAM into ".vam_install_path."?","&Y\n&N")
            " I'm sorry having to add this reminder. Eventually it'll pay off.
            call confirm("Remind yourself that most plugins ship with ".
                        \"documentation (README*, doc/*.txt). It is your ".
                        \"first source of knowledge. If you can't find ".
                        \"the info you're looking for in reasonable ".
                        \"time ask maintainers to improve documentation")
            call mkdir(vam_install_path, 'p')
            execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(vam_install_path, 1).'/vim-addon-manager'
            " VAM runs helptags automatically when you install or update
            " plugins
            exec 'helptags '.fnameescape(vam_install_path.'/vim-addon-manager/doc')
          endif

          " Example: drop git sources unless git is in PATH. Same plugins can
          " be installed form www.vim.org. Lookup MergeSources to get more control
          " let g:vim_addon_manager['drop_git_sources'] = !executable('git')

          call vam#ActivateAddons(['fugitive', 'github:vim-scripts/a.vim', 'github:fholgado/minibufexpl.vim'], {'auto_install' : 0})
          " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})
          " - look up source from pool (<c-x><c-p> complete plugin names):
          " ActivateAddons(["foo", ..
          " - name rewritings:
          " ..ActivateAddons(["github:foo", .. => github://foo/vim-addon-foo
          " ..ActivateAddons(["github:user/repo", .. => github://user/repo
          " Also see section "2.2. names of addons and addon sources" in VAM's documentation
        endfun
        call SetupVAM()
        " experimental [E1]: load plugins lazily depending on filetype, See
        " NOTES
        " experimental [E2]: run after gui has been started (gvim) [3]
        " option1: au VimEnter * call SetupVAM()
        " option2: au GUIEnter * call SetupVAM()
        " See BUGS sections below [*]
        " Vim 7.0 users see BUGS section [3]

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

set backspace=indent,eol,start " allow backspacing over everything in insert mode

set ts=2
set sw=2
set sts=2

