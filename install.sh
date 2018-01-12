#! /bin/bash

function set_backlight_file_path_in_desktop_file() {
    file_path=$PWD/kb_backlight.sh 
    sed -i "s#PLACEHOLDER#$file_path#g" .desktop
    echo '.desktop file path set'
}

function enable_kb_backlight_at_start_up() {
    ln -s $PWD/.desktop $HOME/.config/autostart/.desktop
    echo 'Keyboard backlight enabled at start up'	
}

function turn_on_kb_backlight() {
    sh ./kb_backlight.sh
    echo 'Keyboard backlight turned on'
}

function copy_monitor_config_file() {
    cp $HOME/.config/monitors.xml /var/liv/gdm/.config/monitors.xml
}


set_backlight_file_path_in_desktop_file
enable_kb_backlight_at_start_up
turn_on_kb_backlight
copy_monitor_config_file

