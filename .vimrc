set nocompatible
let mapleader=","

runtime bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()
syntax on
filetype plugin indent on

runtime macros/matchit.vim

for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
	exe 'source' fpath
endfor



" Placeholder for OS-specific config
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
elseif os == 'Linux'
endif




