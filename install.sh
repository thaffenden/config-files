#! /bin/bash
# Install: git, zsh, zsh theme (wynwyn-minimal)

function copy_monitor_config_file() {
    cp $HOME/.config/monitors.xml /var/liv/gdm/.config/monitors.xml
    echo 'Set default monitor config at boot'
}

function create_vim_directories() {
  mkdir $HOME/.vim/backup
  mkdir $HOME/.vim/swap
  mkdir $HOME/.vim/undo
}

function install_vundle() {
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

function symlink_file() {
    ln -s $PWD/$1 $2
    echo $3
}

function set_backlight_file_path_in_desktop_file() {
    file_path=$PWD/kb_backlight.sh 
    sed -i "s#PLACEHOLDER#$file_path#g" .desktop
    echo '.desktop file path set'
}

function turn_on_kb_backlight() {
    sh ./kb_backlight.sh
    echo 'Keyboard backlight turned on'
}

install_vundle
create_vim_directories
set_backlight_file_path_in_desktop_file
turn_on_kb_backlight
symlink_file .desktop $HOME/.config/autostart/.desktop 'Keyboard backlight enabled at start up'

symlink_file .zshrc $HOME/.zshrc 'Created symlink for .zshrc file'
symlink_file ./vim/.vimrc $HOME/.vimrc 'Created symlink for .vimrc file'

copy_monitor_config_file
