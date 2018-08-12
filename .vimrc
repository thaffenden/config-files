set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" functionality
Plugin 'itchyny/lightline.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-fugitive'
" aesthetic
Plugin 'joshdick/onedark.vim'
" language specific
" general lint/code quality
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'w0rp/ale'

" Docker
Plugin 'ekalinin/Dockerfile.vim'

" Typescript
Plugin 'leafgarland/typescript-vim'

call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration 

" fix backspace
set backspace=indent,eol,start

set number

set shiftwidth=4
set tabstop=4
set autoindent

set linebreak
set noexpandtab

" Enable highlighting of the current line
set cursorline

set encoding=utf-8
set guifont=Source\ Code\ Pro\ Nerd\ Font\ Complete\ Mono\ 14

if (has("termguicolors"))
  set termguicolors
endif

" ********** NERDTREE CONFIG **********
" enable NERDTree at start
autocmd vimenter * NERDTree

" disable it when you close the last file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toggle it with ctrl + n
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

" ********** LIGHTLINE CONFIG **********
set laststatus=2
set noshowmode
" set showtabline=2
" set guioptions-=e

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'filename', 'modified', 'readonly' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'NoFormat',
      \   'fileencoding': 'NoFormat'
      \ },
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! NoFormat()
  return ''
endfunction

" ********** DEOPLETE.NVIM CONFIG **********
let g:deoplete#enable_at_startup = 1

" COLOUR SCHEME
syntax on
colorscheme onedark
