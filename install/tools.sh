#! /bin/bash
function install_alacritty() {
  sudo add-apt-repository ppa:mmstick76/alacritty
  sudo apt install alacritty
}

function install_bat() {
  bat_version="0.15.0"
  bat_package_name="bat_${bat_version}_amd64.deb"
  curl -LO https://github.com/sharkdp/bat/releases/download/v$bat_version/$bat_package_name && sudo dpkg -i $bat_package_name && rm $bat_package_name
}

function install_jq() {
  sudo apt-get install jq
}

function install_node_version_manager() {
  curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash
}

function install_ripgrep() {
  rg_version="11.0.2"
  rg_package_name="ripgrep_${rg_version}_amd64.deb"
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/$rg_version/$rg_package_name && sudo dpkg -i $rg_package_name && rm $rg_package_name
}

function install_tmux() {
  sudo apt install tmux
}

install_node_version_manager
install_ripgrep
install_bat
install_jq
install_tmux
install_alacritty
