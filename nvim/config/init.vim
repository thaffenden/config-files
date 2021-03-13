set autoindent 			                      "auto indent new lines
set backspace=indent,eol,start 	          "use backspace character like proper delete
set encoding=utf-8                        "default encoding
set expandtab 			                      "expand tab character to spaces
set number 			                          "display line numbers in file
set relativenumber 		                    "make line numbers relative
set spell 			                          "enable spell check by default
set spellfile=~/.vim/spell/en.utf-8.add   "spell file location for custom terms
set spelllang=en 		                      "set spelling to English
set showmatch 			                      "show matching brackets
set shiftwidth=2 		                      "indentation is 2 spaces
set tabstop=2                             "tabs are 2 spaces

source $HOME/.config/nvim/plugins/_loader.vim
source $HOME/.config/nvim/plugins/colors.vim
source $HOME/.config/nvim/plugins/fzf.vim
source $HOME/.config/nvim/plugins/lightline.vim
source $HOME/.config/nvim/plugins/nerdtree.vim
