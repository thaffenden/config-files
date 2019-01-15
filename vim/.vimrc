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
" Plugin 'ctrlpvim/ctrlp.vim'
" aesthetic
Plugin 'joshdick/onedark.vim'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" language specific
" general lint/code quality
Plugin 'Shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'w0rp/ale'
Plugin 'SirVer/ultisnips'

" Docker
Plugin 'ekalinin/Dockerfile.vim'

" Go
Plugin 'fatih/vim-go'

" Markdown
Plugin 'shime/vim-livedown'

" Python
Plugin 'python-mode/python-mode'

" Terraform
Plugin 'hashivim/vim-terraform'

" Typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'ianks/vim-tsx'

call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration 

" fix backspace
set backspace=indent,eol,start

" show line numbers
set number relativenumber

" enable spell checking
set spelllang=en
set spell

" configure tab settings
set shiftwidth=4
set tabstop=4
set autoindent
set expandtab

autocmd Filetype make setlocal noexpandtab
autocmd Filetype yaml setlocal shiftwidth=2 tabstop=2
autocmd Filetype json setlocal shiftwidth=2 tabstop=2
autocmd Filetype javascript setlocal shiftwidth=2 tabstop=2
autocmd Filetype typescript setlocal shiftwidth=2 tabstop=2
autocmd Filetype python setlocal shiftwidth=4 tabstop=4

set linebreak

" save .swp files to non project directory
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" make switching modes quicker
set timeoutlen=1000 ttimeoutlen=0

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
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" toggle it with ctrl + n
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

" ********** LIGHTLINE CONFIG **********
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'one',
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

" ********** COLOUR SCHEME **********
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

syntax on
colorscheme onedark

" ********** CTRLP CONFIG **********
let g:ctrlp_custom_ignore = '\v[\/](node_modules|__pycache__|vendor|bin|lib|include)|(\.(swp|ico|git|svn))$'


" ********** LANGUAGE CONFIG **********
let g:ale_completion_enabled = 1

" python
let g:pymode_python = 'python3'

" ********** ULTISNIPS CONFIG **********
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ********** LIVEDOWN CONFIG **********
let g:livedown_open = 1
let g:livedown_browser = "firefox"
