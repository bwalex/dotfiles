set nocompatible
let mapleader=","

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
set showcmd "Show the (partial) command as itâs being typed
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



" Persistent undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif



" If you visually select something and hit paste
" that thing gets yanked into your buffer. This
" generally is annoying when you're copying one item
" and repeatedly pasting it. This changes the paste
" command in visual mode so that it doesn't overwrite
" whatever is in your paste buffer.
"
vnoremap p "_dP


" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null



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

let NERDTreeMinimalUI = 1 " is this useful?
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




" via: http://rails-bestpractices.com/posts/60-remove-trailing-whitespace
" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
" Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
" Do the business:
    %s/\s\+$//e
" Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
command! StripTrailingWhitespaces call <SID>StripTrailingWhitespaces()
nmap <leader>w :StripTrailingWhitespaces<CR>









" ," Surround a word with "quotes"
map <leader>" ysiw"
vmap <leader>" c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map <leader>' ysiw'
vmap <leader>' c'<C-R>"'<ESC>


" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map <leader>( ysiw(
map <leader>) ysiw)
vmap <leader>( c( <C-R>" )<ESC>
vmap <leader>) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map <leader>] ysiw]
map <leader>[ ysiw[
vmap <leader>[ c[ <C-R>" ]<ESC>
vmap <leader>] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map <leader>} ysiw}
map <leader>{ ysiw{
vmap <leader>} c{ <C-R>" }<ESC>
vmap <leader>{ c{<C-R>"}<ESC>


" gary bernhardt's hashrocket
imap <c-l> <space>=><space>




"Go to last edit location with ,.
nnoremap <leader>. '.


" Zoom in and out of current window with ,gz
map <silent> <leader>gz <C-w>o



" Resize windows with arrow keys
nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right> <C-w>>



" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>



highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" The above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/




" Prevent vim-session from asking us to load the session.
" If you want to load the session, use :SaveSession and :OpenSession
let g:session_autosave = 'no'
let g:session_autoload = 'no'




augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END


nnoremap <leader>u :GundoToggle<cr>
