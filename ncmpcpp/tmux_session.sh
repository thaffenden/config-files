#!/usr/bin/env sh
# CHECK FOR TMUX SESSION CALLED MUSIC
# IF SESSION DOES NOT EXIST - CREATE IT
# ATTACH TO IT
# CHECK IF MPD IS RUNNING
SESSION_NAME="music"

arrange_session() {
  # tmux new-session -d -s "$SESSION_NAME"
  # split to get art on the left and ncmpcpp on the right
  tmux split-window -h
  # resize so album art section is the right size
  tmux resize-pane -x 70
  # split side bar section for tag editing below album art
  tmux select-pane -t 0
  tmux split-window -v
  # run kunst
  tmux select-pane -t 1
  tmux send-keys 'clear' C-m
  tmux send-keys 'kunst --music_dir /media/tristan/HDD/music/ --size 625x625 --save-cover' C-m
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
  # start album art side panel
  tmux select-pane -t 0
  tmux send-keys 'clear' C-m
  tmux send-keys '~/.config/ncmpcpp/cover.sh > /dev/null 2>&1' C-m
  # select ncmpcpp
  tmux select-pane -t 2
  # tmux attach-session -t "$SESSION_NAME"
}

initialise_tmux_session() {
  if [ -z "$TMUX" ]; then
    # check for active music session
    attached=$(tmux a -t "$SESSION_NAME")
    if [ "$?" = "1" ]; then
      tmux new -s "$SESSION_NAME"
    fi
  else
    current_session=$(tmux display-message -p '#S')
    if [ "$current_session" !=  "$SESSION_NAME" ]; then
      tmux switch -t "$SESSION_NAME"
    fi
  fi
}

start_mpd() {
  pidof mpd
  if [ "$?" = "1" ]; then
    mpd
  fi
}

main() {
  # initialise_tmux_session
  start_mpd
  arrange_session
}

main
