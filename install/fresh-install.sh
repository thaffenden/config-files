#! /bin/bash
function generate_ssh_key() {
  ssh-keygen
  read -n 1 -p "SSH key added to github? (copy with cat $HOME/.ssh/id_rsa.pub | xclip -selection clipboard)" copied
}

function install_config_repo() {
  mkdir $HOME/git
  git clone git@github.com:thaffenden/config-files.git $HOME/git/config-files
}

function install_core_deps() {
  sudo apt install git zsh vim xclip
}

function install_oh_my_zsh() {
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
}

function install_terminal_theme() {
  mkdir $HOME/.zsh
  git clone git@github.com:thaffenden/pure.git $HOME/.zsh/pure
}

install_core_deps
generate_ssh_key
install_oh_my_zsh
install_terminal_theme
install_config_repo
