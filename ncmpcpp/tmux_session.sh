#!/usr/bin/env sh
tmux rename-session "music"
# split to get art on the left and ncmpcpp on the right
tmux split-window -h
# resize so album art section is the right size
tmux resize-pane -t 0 -x 70
# split side bar section for tag editing below album art
tmux select-pane -t 0
tmux split-window -v
# start album art side panel
tmux select-pane -t 0
tmux send-keys 'clear' C-m
tmux send-keys '~/.config/ncmpcpp/cover.sh > /dev/null 2>&1' C-m
# go to media dir
tmux select-pane -t 1
tmux send-keys 'cd /media/tristan/HDD/music' C-m
# open ncmpcpp
tmux select-pane -t 2
tmux send-keys 'ncmpcpp' C-m
