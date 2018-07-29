" clear highlighting of hlsearch
nmap <leader>c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>
nmap \c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR>

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


"" vim-sexp
"""""""""""
" based on tpope/vim-sexp-mappings-for-regular-people

function! s:map_sexp_wrap(type, target, left, right, pos)
  execute (a:type ==# 'v' ? 'x' : 'n').'noremap'
        \ '<buffer><silent>' a:target ':<C-U>let b:sexp_count = v:count<Bar>exe "normal! m`"<Bar>'
        \ . 'call sexp#wrap("'.a:type.'", "'.a:left.'", "'.a:right.'", '.a:pos.', 0)'
        \ . '<Bar>silent! call repeat#set("'.a:target.'", v:count)<CR>'
endfunction

function! s:sexp_mappings() abort
  if !exists('g:sexp_loaded')
    return
  endif
  call s:map_sexp_wrap('e', 'cseb', '(', ')', 0)
  call s:map_sexp_wrap('e', 'cse(', '(', ')', 0)
  call s:map_sexp_wrap('e', 'cse)', '(', ')', 1)
  call s:map_sexp_wrap('e', 'cse[', '[', ']', 0)
  call s:map_sexp_wrap('e', 'cse]', '[', ']', 1)
  call s:map_sexp_wrap('e', 'cse{', '{', '}', 0)
  call s:map_sexp_wrap('e', 'cse}', '{', '}', 1)

  call s:map_sexp_wrap('f', 'csfb', '(', ')', 0)
  call s:map_sexp_wrap('f', 'csf(', '(', ')', 0)
  call s:map_sexp_wrap('f', 'csf)', '(', ')', 1)
  call s:map_sexp_wrap('f', 'csf[', '[', ']', 0)
  call s:map_sexp_wrap('f', 'csf]', '[', ']', 1)
  call s:map_sexp_wrap('f', 'csf{', '{', '}', 0)
  call s:map_sexp_wrap('f', 'csf}', '{', '}', 1)

  nmap <buffer> dsf <Plug>(sexp_splice_list)

  "nmap <buffer> B   <Plug>(sexp_move_to_prev_element_head)
  "nmap <buffer> W   <Plug>(sexp_move_to_next_element_head)
  "nmap <buffer> gE  <Plug>(sexp_move_to_prev_element_tail)
  "nmap <buffer> E   <Plug>(sexp_move_to_next_element_tail)
  "xmap <buffer> B   <Plug>(sexp_move_to_prev_element_head)
  "xmap <buffer> W   <Plug>(sexp_move_to_next_element_head)
  "xmap <buffer> gE  <Plug>(sexp_move_to_prev_element_tail)
  "xmap <buffer> E   <Plug>(sexp_move_to_next_element_tail)
  "omap <buffer> B   <Plug>(sexp_move_to_prev_element_head)
  "omap <buffer> W   <Plug>(sexp_move_to_next_element_head)
  "omap <buffer> gE  <Plug>(sexp_move_to_prev_element_tail)
  "omap <buffer> E   <Plug>(sexp_move_to_next_element_tail)

  nmap <buffer> <I  <Plug>(sexp_insert_at_list_head)
  nmap <buffer> >I  <Plug>(sexp_insert_at_list_tail)
  nmap <buffer> <f  <Plug>(sexp_swap_list_backward)
  nmap <buffer> >f  <Plug>(sexp_swap_list_forward)
  nmap <buffer> <e  <Plug>(sexp_swap_element_backward)
  nmap <buffer> >e  <Plug>(sexp_swap_element_forward)
  nmap <buffer> >(  <Plug>(sexp_emit_head_element)
  nmap <buffer> <)  <Plug>(sexp_emit_tail_element)
  nmap <buffer> <(  <Plug>(sexp_capture_prev_element)
  nmap <buffer> >)  <Plug>(sexp_capture_next_element)

  nmap <buffer> <re <Plug>(sexp_raise_element)
  nmap <buffer> <rf <Plug>(sexp_raise_list)
  nmap <buffer> <sf <Plug>(sexp_raise_list)
endfunction

augroup sexp_mappings_for_regular_people
  autocmd!
  autocmd FileType lisp,clojure,scheme call s:sexp_mappings()
augroup END
