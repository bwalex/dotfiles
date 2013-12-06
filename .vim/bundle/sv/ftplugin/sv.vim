" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" set indentexpr=GetSVIndent()

" For filename completion, ignore files with .vro extension
" set suffixes+=.vro

" Automatically add the sv extension when searching for files, like with gf
" or [i
setlocal suffixesadd=.v,.sv,.vh,.svh

setlocal include=^\\s*`include
setlocal define=^\\s*`define

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croql

" Set 'comments' to format dashed lists in comments
" setlocal com& com^=sO:*\ -,mO:*\ \ ,exO:*/  " Behaves just like C
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-

" Make sure the continuation lines below do not cause problems in
" compatibility mode.
set cpo-=C

