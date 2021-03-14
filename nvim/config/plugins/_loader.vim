call plug#begin('~/.config/nvim/autoload/plugged')
  " navigational
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

  " aesthetic
  " Plug 'itchyny/lightline.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'ryanoasis/vim-devicons'   "used in NERDTree, fzf search, lightline
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  " code
  Plug 'editorconfig/editorconfig-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  "functionality
  Plug 'Townk/vim-autoclose'
  Plug 'tpope/vim-surround'

  """ Language plugins
  " Typescript
  Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

call plug#end()
