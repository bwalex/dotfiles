set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()
syntax on
filetype plugin indent on



"" Sensible defaults
"""""""""""
set autoindent
set backspace=indent,eol,start
set hlsearch
set incsearch
set ruler
set laststatus=2
set showcmd
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

"set t_Co=256
colorscheme railscasts

" not convinced yet
set smarttab
if has("multi_byte")
	set enc=utf-8
endif

" enable spell checking on commit messages
autocmd BufNewFile,BufRead *.git/COMMIT_EDITMSG  set spell

" clear highlighting of hlsearch
nnoremap <silent> <C-L> :nohlsearch<cr><C-L>

" set GUI font
if has("gui")
	set guifont=Source\ Code\ Pro\ 10
endif

" C Options
set cinoptions=:0,g0,t0,+4,(0,u0,W4
let c_space_errors=1
let c_gnu=1

" Use the 'unnamed' clipboard by default - which is
" the middle-click buffer on Linux and the normal
" ctrl+c/ctrl+v buffer on Windows and Mac.
" 'unnamedplus' is the ctrl+c/ctrl+v buffer on
" Linux.
set clipboard=unnamed

" Placeholder for OS-specific config
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
elseif os == 'Linux'
endif


"" SkyBison
"""""""""""

nnoremap <leader>b 2:<c-u>call SkyBison("b ")<cr>
nnoremap <leader>t 2:<c-u>call SkyBison("tag ")<cr>
nnoremap <leader>h 2:<c-u>call SkyBison("h ")<cr>
nnoremap <leader>e :<c-u>call SkyBison("e ")<cr>

" While nice and all, this makes a mess (e.g. not showing the changes-not-saved warning)
"nnoremap : :<c-u>call SkyBison("")<cr>


"" Unite
"""""""""""

nnoremap <leader>B :<c-u>Unite buffer<cr>
nnoremap <leader>E :<c-u>Unite file<cr>


"" Airline
"""""""""""

let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#branch#empty_message = 'No branch'
"let g:airline#extensions#branch#use_vcscommand = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0


"" NERDTree
"""""""""""

nnoremap <leader>n :<c-u>NERDTree<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"" tmux-navigator
"""""""""""

nnoremap <silent> <c-left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <c-down>  :TmuxNavigateDown<cr>
nnoremap <silent> <c-up>    :TmuxNavigateUp<cr>
nnoremap <silent> <c-right> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\>     :TmuxNavigatePrevious<cr>


"" vim-textobj-rubyblock
"""""""""""

runtime macros/matchit.vim
