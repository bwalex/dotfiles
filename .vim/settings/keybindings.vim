" clear highlighting of hlsearch
nmap \c :nohlsearch<cr>
nmap <leader>c :nohlsearch<cr>

" ," Surround a word with "quotes"
map <leader>s" ysiw"
vmap <leader>s" c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map <leader>s' ysiw'
vmap <leader>s' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map <leader>s( ysiw(
map <leader>s) ysiw)
vmap <leader>s( c( <C-R>" )<ESC>
vmap <leader>s) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map <leader>s] ysiw]
map <leader>s[ ysiw[
vmap <leader>s[ c[ <C-R>" ]<ESC>
vmap <leader>s] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map <leader>s} ysiw}
map <leader>s{ ysiw{
vmap <leader>s{ c{ <C-R>" }<ESC>
vmap <leader>s} c{<C-R>"}<ESC>

" Go to last buffer
nmap <C-e> :b#<cr>
nnoremap <leader>p :b#<cr>

" Use Tab to switch buffer
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>


" XXX: explore vim-unimpaired (and, to some extent, vim-surround)
" XXX: cheatsheet: Go to last edit location with '.


" Resize windows with arrow keys
nnoremap <D-Up> <C-w>+
nnoremap <D-Down> <C-w>-
nnoremap <D-Left> <C-w><
nnoremap <D-Right> <C-w>>


" Convenient bindings to switch between indent types
nmap <leader>i2  :set expandtab        sts=2 sw=2<cr>
nmap <leader>i4  :set expandtab        sts=4 sw=4<cr>
nmap <leader>it4 :set noexpandtab ts=4 sts=4 sw=4<cr>
nmap <leader>it8 :set noexpandtab ts=8 sts=8 sw=8<cr>


" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> <leader>cf :let @* = expand("%:~")<cr>


"" Unite
"""""""""""
" also supports -default-action=....
nnoremap <leader>B :<c-u>Unite -start-insert buffer<cr>
nnoremap <leader>e :<c-u>Unite file buffer<cr>
nnoremap <leader>o :<c-u>Unite file/new<cr>
" nnoremap <leader>h :<c-u>Unite help<cr>
nnoremap <leader>t :<c-u>Unite tag<cr>
nnoremap <leader>l :<c-u>Unite line<cr>
nnoremap <leader>y :<c-u>Unite -quick-match history/yank<cr>
nnoremap <leader>r :<c-u>Unite file_mru<cr>

"" CtrlP
"""""""""""
nnoremap <leader>b :<c-u>CtrlPBuffer<cr>
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
nnoremap <leader>/ :GrepperAg 


"" vim-dispatch
"""""""""""
nnoremap <leader>d :Dispatch 


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
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a:: :Tabularize /::<CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>


"" visual search
"""""""""""
vnoremap <silent> * :<C-U>call VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call VSetSearch('?')<CR>?<C-R>/<CR>
nmap <unique> <Leader>vl <Plug>VLToggle
vnoremap <silent> _ :<C-U>call VSetSearchAssign('/')<CR>/<C-R>/<CR>
nmap <leader>= /<c-r>='\s'."\\<".expand("<cword>").'\>.*\s\(<=\\|=\)\s'<cr><CR>

"" easymotion
"""""""""""
map  <Leader>j <Plug>(easymotion-j)
map  <Leader>k <Plug>(easymotion-k)
map  <Leader>jj <Plug>(easymotion-bd-f)
nmap <Leader>jj <Plug>(easymotion-overwin-f)
nmap <Leader>jJ <Plug>(easymotion-overwin-f2)
map  <Leader>jl <Plug>(easymotion-bd-jk)
nmap <Leader>jl <Plug>(easymotion-overwin-line)
map  <Leader>jw <Plug>(easymotion-bd-w)
nmap <Leader>jw <Plug>(easymotion-overwin-w)

"" startify
"""""""""""
nnoremap <silent><Leader>h :Startify<CR>
