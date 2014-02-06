set nocompatible
let mapleader=","

runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

runtime macros/matchit.vim

for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
	exe 'source' fpath
endfor
