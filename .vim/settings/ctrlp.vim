if !filereadable(expand("~/.vim/bundle/ctrlp-cmatcher/autoload/fuzzycomt.so"))
  echo "Building ctrlp-cmatcher..."
  call system("cd ~/.vim/bundle/ctrlp-cmatcher && ./install.sh")
endif

let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
