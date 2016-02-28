set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:ycm_show_diagnostics_ui = 0

let g:airline#extensions#syntastic#enabled = 1

let g:syntastic_javascript_checkers = ['eslint']
