set nocompatible
let mapleader=","
set syntax=on

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

call plug#begin('~/.config/nvim/plugged')
" libs {
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mattn/webapi-vim'
Plug 'tomtom/tlib_vim'
Plug 'xolox/vim-misc'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" }

" file manager {
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-vinegar'

Plug 'francoiscabrol/ranger.vim'
" }

" eye-candy {
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
" }

" menus, etc {
Plug 'mbbill/undotree'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mhinz/vim-startify'
" }


" VCS {
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
" }

" syntax {
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rake'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'bhurlow/vim-parinfer'
Plug 'guns/vim-sexp'
" Plug 'tpope/vim-fireplace'
Plug 'jvirtanen/vim-hcl'

let g:conjure_log_direction = 'horizontal'
let g:conjure_log_blacklist = ["up", "ret", "ret-multiline", "load-file", "eval"]
Plug 'Olical/conjure', { 'tag': 'v4.48.0' }

"let g:iced_default_key_mapping_leader = '<LocalLeader>'
"Plug 'liquidz/vim-iced'
" }

" autocomplete, lint, etc {
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'liquidz/vim-iced-asyncomplete'

" Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

if v:version < 800
Plug 'scrooloose/syntastic'
else
Plug 'dense-analysis/ale'
end
" }

Plug 'editorconfig/editorconfig-vim'
" Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
" Plug 'garbas/vim-snipmate'
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'
Plug 'terryma/vim-expand-region'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

Plug 'easymotion/vim-easymotion'
Plug 'kshenoy/vim-signature'
Plug 'terryma/vim-multiple-cursors'
Plug 'matze/vim-move'


" colorschemes {
" Plug 'xolox/vim-colorscheme-switcher'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim', { 'branch': 'main' }
" Plug 'altercation/vim-colors-solarized'
" Plug 'tomasr/molokai'
" Plug 'jnurmine/Zenburn'
" Plug 'Lokaltog/vim-distinguished'
" Plug 'romainl/Apprentice'
" Plug 'junegunn/seoul256.vim'
Plug 'liuchengxu/space-vim-dark'

let g:doom_one_terminal_colors = v:true
Plug 'romgrk/doom-one.vim'

"Plug 'NTBBloodbath/doom-one.nvim', { 'branch': 'main' }
" }

" tmux {
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
" }

" files {
Plug 'mhinz/vim-hugefile'
Plug 'mhinz/vim-grepper'
Plug 'danro/rename.vim'
" }

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
