#!/usr/bin/env sh
tmux rename-session "music"
# split to get art on the left and ncmpcpp on the right
tmux split-window -h
# resize so album art section is the right size
tmux resize-pane -t 1 -x 70
# split side bar section for tag editing below album art
tmux select-pane -t 0
tmux split-window -v
# open ncmpcpp
tmux select-pane -t 2
tmux send-keys 'ncmpcpp' C-m
# create split for media dir
tmux split-window -h
tmux resize-pane -t 3 -x 100
tmux resize-pane -t 1 -x 70
# go to media dir
tmux select-pane -t 3
tmux send-keys 'cd /media/tristan/HDD/music' C-m
tmux send-keys 'clear' C-m
# run kunst
tmux select-pane -t 1
tmux send-keys 'clear' C-m
tmux send-keys 'kunst --music_dir /media/tristan/HDD/music/ --size 625x625' C-m
# start album art side panel
tmux select-pane -t 0
tmux send-keys 'clear' C-m
tmux send-keys '~/.config/ncmpcpp/cover.sh > /dev/null 2>&1' C-m
# select ncmpcpp
tmux select-pane -t 2
