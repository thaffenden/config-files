call plug#begin('~/.config/nvim/autoload/plugged')
  " navigational
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()
