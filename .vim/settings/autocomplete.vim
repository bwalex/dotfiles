"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

let g:neocomplcache_enable_at_startup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#min_syntax_length = 0
let g:neocomplete#use_vimproc=1

" function! s:my_cr_function()
" 	return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" endfunction
" imap <expr><silent> <CR> <SID>my_cr_function()
" imap <C-X><CR> <CR><Plug>AlwaysEnd
"
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
