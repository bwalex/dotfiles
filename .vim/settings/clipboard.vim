" Use the 'unnamed' clipboard by default - which is
" the middle-click buffer on Linux and the normal
" ctrl+c/ctrl+v buffer on Windows and Mac.
" 'unnamedplus' is the ctrl+c/ctrl+v buffer on
" Linux.
set clipboard=unnamed

" If you visually select something and hit paste
" that thing gets yanked into your buffer. This
" generally is annoying when you're copying one item
" and repeatedly pasting it. This changes the paste
" command in visual mode so that it doesn't overwrite
" whatever is in your paste buffer.
"
vnoremap p "_dP
