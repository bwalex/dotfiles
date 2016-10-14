set nocompatible
let mapleader=","

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --tern-completer --gocode-completer && cd third_party/ycmd/third_party/tern_runtime && npm install tern-jspm
  endif
  " { 'do': function('BuildYCM') }
endfunction

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --gocode-completer && cd third_party/ycmd/third_party/tern_runtime && npm install tern-jspm' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/syntastic'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'nixprime/cpsm', { 'do': './install.sh' }
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'

Plug 'elubow/cql-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'garbas/vim-snipmate'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-expand-region'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'mustache/vim-mustache-handlebars'
Plug 'thoughtbot/vim-rspec'
Plug 'vim-ruby/vim-ruby'
Plug 'derekwyatt/vim-scala'
Plug 'mhinz/vim-signify'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mattn/webapi-vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'xolox/vim-colorscheme-switcher'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'jnurmine/Zenburn'
Plug 'Lokaltog/vim-distinguished'
Plug 'romainl/Apprentice'
Plug 'junegunn/seoul256.vim'

Plug 'easymotion/vim-easymotion'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-hugefile'
Plug 'mhinz/vim-grepper'

Plug 'MarcWeber/vim-addon-mw-utils'

" XXX?
Plug 'tomtom/tlib_vim'
Plug 'xolox/vim-misc'


Plug '~/.vim/bundle/ansiesc'
Plug '~/.vim/bundle/scratch.vim'
Plug '~/.vim/bundle/sv'
call plug#end()


syntax on
filetype plugin indent on

runtime macros/matchit.vim

for fpath in split(globpath('~/.vim/settings', '*.vim'), '\n')
	exe 'source' fpath
endfor
