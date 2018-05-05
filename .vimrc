set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Utilities
Plugin 'jdkanani/vim-material-theme'
Plugin 'tpope/vim-fugitive'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'itchyny/lightline.vim'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Townk/vim-autoclose'

" General code

" Language Specific
" Docker
Plugin 'ekalinin/Dockerfile.vim'

" Typescript
Plugin 'leafgarland/typescript-vim'

" Python


" Go

call vundle#end()            " required
filetype plugin indent on    " required


set termguicolors
set shiftwidth=4
set number
set tabstop=4
set expandtab
set autoindent
set backspace=indent,eol,start
set linebreak
set noexpandtab

syntax enable
set background=dark
colorscheme material-theme
set t_Co=256

" ********** LIGHTLINE CONFIG **********
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileFormat',
      \ },
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction


" ********** NERDTREE CONFIG **********
" enable NERDTree at start
autocmd vimenter * NERDTree

" disable it when you close the last file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toggle it with ctrl + n
map <C-n> :NERDTreeToggle<CR>
map <C-m> :NERDTree<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

set encoding=utf-8
set guifont=Source\ Code\ Pro\ Nerd\ Font\ Complete\ Mono\ 14

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" ********** NERDTREE DEV ICONS CONFIG **********
" Limit file icons to only these to stop lag.

