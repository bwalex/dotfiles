" w!! to write a file as sudo
" stolen from Steve Losh
cmap w!! w !sudo tee % >/dev/null
cnoremap sudow w !sudo tee % >/dev/null
