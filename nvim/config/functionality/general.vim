set autoindent 			                      "auto indent new lines
set backspace=indent,eol,start 	          "use backspace character like proper delete
set clipboard=unnamedplus                 "copy paste between vim and everything else
set encoding=utf-8                        "default encoding
set expandtab 			                      "expand tab character to spaces
set iskeyword+=-                          "treat dash separated words as a word text object"
set noincsearch                           "wait for enter to actually search
set number 			                          "display line numbers in file
set relativenumber 		                    "make line numbers relative
set showmatch 			                      "show matching brackets
set shiftwidth=2 		                      "indentation is 2 spaces
set spell 			                          "enable spell check by default
set spellfile=~/.vim/spell/en.utf-8.add   "spell file location for custom terms
set spelllang=en 		                      "set spelling to English
set splitbelow                            "horizontal splits open below
set splitright                            "vertical splits open to the right
set tabstop=2                             "tabs are 2 spaces

let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<shift><tab>"
let g:UltiSnipsEditSplit="vertical"
