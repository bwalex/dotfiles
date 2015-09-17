" Keep original , as ,,
nnoremap <leader>, ,

" clear highlighting of hlsearch
nmap \q :nohlsearch<cr>
nmap \c :nohlsearch<cr>

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

" Go to last buffer
nmap <C-e> :b#<cr>
nnoremap <leader>p :b#<cr>

" Go to last edit location with ,.
nnoremap <leader>. '.


" Zoom in and out of current window with ,gz
map <silent> <leader>gz <C-w>o


" Resize windows with arrow keys
nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right> <C-w>>


" Convient bindings to switch between indent types
nmap <leader>i2  :set expandtab        sts=2 sw=2<cr>
nmap <leader>i4  :set expandtab        sts=4 sw=4<cr>
nmap <leader>it4 :set noexpandtab ts=4 sts=4 sw=4<cr>
nmap <leader>it8 :set noexpandtab ts=8 sts=8 sw=8<cr>


" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> <leader>cf :let @* = expand("%:~")<cr>


nnoremap <leader>m :Man 


"" Unite
"""""""""""
" also supports -default-action=....
nnoremap <leader>b :<c-u>Unite -start-insert buffer<cr>
nnoremap <leader>e :<c-u>Unite file<cr>
nnoremap <leader>o :<c-u>Unite file/new<cr>
nnoremap <leader>h :<c-u>Unite help<cr>
nnoremap <leader>t :<c-u>Unite tag<cr>
nnoremap <leader>y :<c-u>Unite -quick-match history/yank<cr>
nnoremap <leader>r :<c-u>Unite file_mru<cr>

"" CtrlP
"""""""""""
nnoremap <leader>B :<c-u>CtrlPBuffer<cr>
nnoremap <leader>E :<c-u>CtrlP<cr>
nnoremap <leader>W :<c-u>CtrlPCurWD<cr>
nnoremap <leader>T :<c-u>CtrlPTag<cr>
nnoremap <leader>R :<c-u>CtrlPMRUFiles<cr>

"" NERDTree
"""""""""""
nnoremap <leader>n :<c-u>NERDTreeToggle<cr>


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


"" VCSCommand
"""""""""""
nmap <leader>cD :VCSDiff <C-R><C-W><CR>
nmap <leader>cr :VCSReview <C-R><C-W><CR>
nnoremap <leader>cb :VCSBlame<CR>
nnoremap <leader>cB :VCSBlame!<CR>


"" Fugitive
"""""""""""
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>ga :Gadd<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gM :Gmove
nnoremap <leader>gD :Gremove<cr>
nnoremap <leader>gR :Gread<cr>
nnoremap <leader>gW :Gwrite<cr>


"" vimux
"""""""""""
nnoremap <leader>rc :VimuxPromptCommand<cr>
nnoremap <leader>vp :VimuxPromptCommand<cr>

"" vim-expand-region
"""""""""""
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)


"" visual search
"""""""""""
vnoremap <silent> * :<C-U>call VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call VSetSearch('?')<CR>?<C-R>/<CR>
nmap <unique> <Leader>vl <Plug>VLToggle
vnoremap <silent> _ :<C-U>call VSetSearchAssign('/')<CR>/<C-R>/<CR>
nmap <leader>= /<c-r>='\s'."\\<".expand("<cword>").'\>.*\s\(<=\\|=\)\s'<cr><CR>
