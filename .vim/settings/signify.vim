" Git is handled by gitgutter, which seems a bit more robust,
" e.g. around showing changes on the first line.
let g:signify_vcs_list = [ 'svn', 'hg', 'bzr' ]

highlight SignifySignAdd    ctermfg=2
highlight SignifySignDelete ctermfg=1
highlight SignifySignChange ctermfg=3
