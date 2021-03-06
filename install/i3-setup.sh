#! /bin/bash
function install_core_deps() {
  sudo add-apt-repository ppa:kgilmer/speed-ricer
  sudo apt update

  sudo apt install i3-gaps polybar rofi compton feh playerctl
}

function symlink_config() {
  ln -s $HOME/git/config-files/i3 $HOME/.config/i3
  ln -s $HOME/git/config-files/polybar $HOME/.config/polybar
  ln -s $HOME/git/config-files/picom $HOME/.config/picom
  ln -s $HOME/git/config-files/picom/picom-rc $HOME/.nv/nvidia-application-profiles-rc.d/picom-rc
  ln -s $HOME/git/config-files/compton/compton.conf $HOME/.config/compton.conf
  ln -s $HOME/git/config-files/rofi $HOME/.config/rofi
  ln -s $HOME/git/config-files/dunst $HOME/.config/dunst
}

install_core_deps
symlink_config
