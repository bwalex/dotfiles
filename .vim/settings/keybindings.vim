" Keep original , as ,,
nnoremap <leader>, ,

" clear highlighting of hlsearch
nnoremap <silent> <C-L> :nohlsearch<cr><C-L>

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
nnoremap <silent> <leader>cf :let @* = expand("%:~")<cr>


nnoremap <leader>m :Man 



"" SkyBison
"""""""""""
nnoremap <leader>B 2:<c-u>call SkyBison("b ")<cr>
nnoremap <leader>E :<c-u>call SkyBison("e ")<cr>
nnoremap <leader>H 2:<c-u>call SkyBison("h ")<cr>
nnoremap <leader>T 2:<c-u>call SkyBison("tag ")<cr>


"" Unite
"""""""""""
nnoremap <leader>b :<c-u>Unite -quick-match buffer<cr>
nnoremap <leader>e :<c-u>Unite file<cr>
nnoremap <leader>h :<c-u>Unite help<cr>
nnoremap <leader>t :<c-u>Unite tag<cr>
nnoremap <leader>y :<c-u>Unite -quick-match history/yank<cr>


"" NERDTree
"""""""""""
nnoremap <leader>n :<c-u>NERDTree<cr>


"" tmux-navigator
"""""""""""
nnoremap <silent> <c-left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <c-down>  :TmuxNavigateDown<cr>
nnoremap <silent> <c-up>    :TmuxNavigateUp<cr>
nnoremap <silent> <c-right> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\>     :TmuxNavigatePrevious<cr>


"" Gundo
"""""""""""
nnoremap <leader>u :GundoToggle<cr>


"" Ag
"""""""""""
nnoremap <leader>/ :Ag 


"" vim-dispatch
"""""""""""
nnoremap <leader>d :Dispatch 
