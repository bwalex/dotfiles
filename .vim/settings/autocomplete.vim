autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType javascript.jsx setlocal omnifunc=tern#Complete
autocmd FileType javascript setlocal omnifunc=tern#Complete

let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
