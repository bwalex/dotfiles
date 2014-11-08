au BufNewFile,BufRead *.js  setf javascript
au BufNewFile,BufRead *.es6 setf javascript

fun! s:SelectJavascript()
  if getline(1) =~# '^#!.*/bin/env\s\+node\>'
    set ft=javascript
  endif
endfun
au BufNewFile,BufRead * call s:SelectJavascript()

au FileType javascript setl sw=2 sts=2 et

au FileType yaml setl sw=2 sts=2 et

au FileType ruby setl sw=2 sts=2 et
