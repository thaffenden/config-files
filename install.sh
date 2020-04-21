#! /bin/bash
# Install: git, zsh, pure, alacritty, ranger

function copy_monitor_config_file() {
    cp $HOME/.config/monitors.xml /var/liv/gdm/.config/monitors.xml
    echo 'Set default monitor config at boot'
}

function create_config_directories() {
  mkdir $HOME/.vim/backup
  mkdir $HOME/.vim/swap
  mkdir $HOME/.vim/undo
  mkdir $HOME/.tmux
  mkdir $HOME/.config/ranger
}

function install_vim_plug() {
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

install_vim_plug
create_config_directories

symlink_file .zshrc $HOME/.zshrc 'Created symlink for .zshrc file'
symlink_file vim/.vimrc $HOME/.vimrc 'Created symlink for .vimrc file'
symlink_file vim/UltiSnips $HOME/.vim/ 'Created symlink for snippets'
symlink_file vim/coc-settings.json $HOME/.vim/coc-settings.json 'Created symlink for coc settings file'
symlink_file tmux/.tmux.conf $HOME/.tmux.conf 'Created symlink for .tmux.conf file'
symlink_file tmux/battery $HOME/.tmux/battery 'Created symlink for tmux battery indicator file'
symlink_file .gitconfig $HOME/.gitconfig 'Created symlink for git config file'
symlink_file ranger/rc.conf $HOME/.config/ranger/rc.conf 'Created symlink for ranger rc.conf'
symlink_file ranger/scope.sh $HOME/.config/ranger/scope.sh 'Created symlink for ranger scope.sh'
symlink_file .alacritty.yml $HOME/.alacritty.yml 'Created symlink for alacritty config'

if [[ `uname` != "Darwin" ]]; then
  copy_monitor_config_file
  set_backlight_file_path_in_desktop_file
  turn_on_kb_backlight
  symlink_file .desktop $HOME/.config/autostart/.desktop 'Keyboard backlight enabled at start up'
fi
