"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache. (Disabled for now - not quite happy with it yet)
let g:neocomplcache_enable_at_startup = 0
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3

" function! s:my_cr_function()
" 	return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" endfunction
" imap <expr><silent> <CR> <SID>my_cr_function()
" imap <C-X><CR> <CR><Plug>AlwaysEnd
