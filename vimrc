set nocompatible " no vi compatibility!

" Full function names are used whenever possible for clarity.
" Also, commenting is a good thing

fun! SetupVAM()

  let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
  exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

  if !filereadable(vam_install_path.'/vim-addon-manager/.git/config')
     \&& 1 == confirm("Clone VAM into ".vam_install_path."?","&Y\n&N")
    call mkdir(vam_install_path, 'p')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(vam_install_path, 1).'/vim-addon-manager'
    exec 'helptags '.fnameescape(vam_install_path.'/vim-addon-manager/doc')
  endif

  call vam#ActivateAddons(['fugitive',
        \ 'github:vim-scripts/a.vim',
        \ 'github:fholgado/minibufexpl.vim',
        \ 'github:scrooloose/nerdtree',
        \ 'surround',
        \ 'repeat',
        \ 'github:vim-scripts/matchit.zip',
        \ 'abolish',
        \ 'Syntastic',
        \ 'Gundo',
        \ 'SuperTab_continued.',
        \ 'The_NERD_Commenter',
        \ 'tComment',
        \ 'EasyMotion',
        \ 'github:vim-scripts/c.vim',
        \ 'github:jimenezrick/vimerl',
        \ 'delimitMate',
        \ 'xoria256',
        \ 'Lucius',
        \ 'Zenburn',
        \ 'github:tomasr/molokai',
        \ 'github:vim-scripts/taglist.vim',
        \ 'pydoc%910',
        \ 'jpythonfold'
        \ ],
  \ {'auto_install' : 0})

  " TODO change jpythonfold.vim to python.vim so ftplugin works correctly
endfun

" TODO install snipmate when you get other things configured
" it tended to overwrite some of your other settings

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
  syntax on " syntax enable doesn't nuke custom settings
endif

if &t_Co > 2 || has("gui_running")
  set hlsearch
else
  set nohlsearch
endif

filetype plugin indent on " Enable filetype-specific indentation and plugins

" searching options
set incsearch " incremental search
set ignorecase " ignore case when searching
set smartcase " BUT don't ignore case when search contains captial letters
set title " make the terminal window say vim

set nobackup " don't create backup files
set noswapfile " don't use a swapfile
set nowritebackup " don't write backup files

set wildmenu " more menu completion

" indenting options
set smarttab " insert tabs at the beginning of the line according to context
set autoindent " automatic indentation
set smartindent " do smart indenting for stuff
" set copyindent " copy indentation from the previous line when a newline is inserted
set expandtab " only use spaces for tabs. Overrides copyindent

set backspace=indent,eol,start " allow backspacing over everything in insert mode

set shiftwidth=2
set softtabstop=2
set tabstop=2

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

set undodir=~/.vim/backups
set undofile

" ================ Invisibles =======================
" easy toggle for :set list
nmap <leader>l :set list!<CR>

" Use sexy unicode characters for listchars
set listchars=tab:▸\ ,eol:¬,trail:☠

" ==== Misc commands ====
" I need to categorize these later (as well as the rest of my vim config)

set nojoinspaces " don't use 2 spaces after joining a sentence

nmap <leader>n :noh<CR> " don't highlight search results anymore

" Strip trailing whitespaces

" TODO this function as actual pretty general and can be used for other stuff
" see vimcast ep #4
function! Preserve(command)
  " Prep: save previous search and cursor
  " so that this command isn't as disruptive
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Run it!
  execute a:command
  " Restore the stuff saved in prep
  let @/=_s
  call cursor(l, c)
endfunction

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

noremap <F1> <Esc>
inoremap <F1> <Esc>

nnoremap <silent> k gk
nnoremap <silent> j gj

noremap <F2> :NERDTreeToggle<CR>
noremap <F3> :Tlist<CR>

" set cursorline cursorcolumn

color molokai
