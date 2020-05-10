#! /bin/bash
function install_node_version_manager() {
  curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash
}

function install_bat() {
  sudo apt install bat
}

function install_ripgrep() {
  rg_version="11.0.2"
  rg_package_name="ripgrep_" + $rg_version + "_amd64.deb"
  curl -LO https://github.com/BurntSushi/ripgrep/releases/download/$rg_version/$rg_package_name && sudo dpkg -i $rg_package_name && rm $rg_package_name
}

function install_jq() {
  sudo apt-get install jq
}

install_node_version_manager
install_ripgrep
install_bat
install_jq
