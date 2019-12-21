set nocompatible              " be iMproved, required
filetype off                  " required

" ********** ALL PLUGINS **********
call plug#begin('~/.vim/plugged')

" aesthetic
Plug 'joshdick/onedark.vim'
Plug 'ryanoasis/vim-devicons'   "used in NERDTree, fzf search, lightline

" code
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"functionality
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'

" navigational
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

call plug#end()

" ********** STANDARD VIM SETTINGS **********
set autoindent 			                      "auto indent new lines
set backspace=indent,eol,start 	          "use backspace character like proper delete
set backupdir=~/.vim/backup//             "back up directory
set cursorline                            "highlight current line
set directory=~/.vim/swap//               "swap directory
set encoding=utf-8
set expandtab 			                      "expand tab character to spaces
set number 			                          "display line numbers in file
set relativenumber 		                    "make line numbers relative
set spell 			                          "enable spell check by default
set spellfile=~/.vim/spell/en.utf-8.add   "spell file location for custom terms
set spelllang=en 		                      "set spelling to English
set showmatch 			                      "show matching brackets
set shiftwidth=2 		                      "tabs are 2 spaces
set tabstop=2
set undodir=~/.vim/undo//                 "undo directory

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

if (has("termguicolors"))
 set termguicolors
endif

" ********** NERDTREE CONFIG **********  
map <C-n> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
