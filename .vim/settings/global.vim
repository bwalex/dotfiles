"" Sensible defaults
"""""""""""
set autoindent
set backspace=indent,eol,start
set hlsearch
set incsearch
set ruler
set laststatus=2
set showcmd "Show the (partial) command as it's being typed
set wildmenu
set backupcopy=auto,breakhardlink
set title
set showmatch
set foldmethod=marker
set mouse=a
set scrolloff=2
set display+=lastline
set autoread
set history=1000
set tabpagemax=50
set viminfo='50,<1000,s20,h
set gfm+=%f:\ %l:\ %m
set hidden

" Not convinced...
set ignorecase
set smartcase

" Don't reset cursor to start of line when moving around.
set nostartofline

set smarttab

if has("multi_byte")
	set enc=utf-8
endif

set encoding=utf-8
