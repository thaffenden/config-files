#! /bin/bash
function generate_ssh_key() {
  ssh-keygen
  read -n 1 -p "SSH key added to github? (copy with cat $HOME/.ssh/id_rsa.pub | xclip -selection clipboard)" copied
}

function install_core_deps() {
  sudo apt install git zsh vim xclip curl
}

function install_oh_my_zsh() {
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
}

function install_terminal_theme() {
  mkdir $HOME/.zsh
  git clone git@github.com:thaffenden/pure.git $HOME/.zsh/pure
}

function use_zsh() {
  chsh -s $(which zsh)
  echo "shell set to zsh. log out and back in again for changes to take effect."
}

install_core_deps
generate_ssh_key
install_oh_my_zsh
install_terminal_theme
use_zsh
