" plugins
source $HOME/.config/nvim/plugins/_loader.vim
source $HOME/.config/nvim/plugins/coc.vim
source $HOME/.config/nvim/plugins/fzf.vim
" source $HOME/.config/nvim/plugins/lightline.vim
source $HOME/.config/nvim/plugins/nerdtree.vim

" custom functionality
source $HOME/.config/nvim/functionality/general.vim
source $HOME/.config/nvim/functionality/search_for_selected.vim
source $HOME/.config/nvim/functionality/status_line.vim

" theme
source $HOME/.config/nvim/theme/colors.vim

luafile $HOME/.config/nvim/init.lua
