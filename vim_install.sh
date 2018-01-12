#! /bin/bash

function install_pathogen() {
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    echo 'Pathogen installed'
}

function install_plugin() {
    cd ~/.vim/bundle &&
    git clone $1
    echo "Plugin installed: $1"
}

function configure_helptags() {
    vim -u NONE -c "helptags $1" -c q
}

install_plugin 'https://github.com/tpope/vim-fugitive.git'
configure_helptags 'vim-fugitive/doc'

install_plugin 'https://github.com/scrooloose/nerdtree.git'
configure_helptags 'nerdtree/doc'

install_plugin 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
install_plugin 'https://github.com/ryanoasis/vim-devicons'

