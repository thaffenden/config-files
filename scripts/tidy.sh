#! /bin/bash

# Script to delete old files and free up disk space
confirm_command() {
  command_name=$1
  command=$2

  echo "Do you want to $command_name? (y/n)"
  read CONFIRM 

  if [ $CONFIRM != "y" ]; then
    echo "skipping"
    return 1
  fi

  $command
}

main() {
  clean_commands=("logs" "snap")
  declare -A command_names=(
    [logs]="remove old log files"
    [snap]="remove old snap packages"
  )

  declare -A command_strings=(
    [logs]="sudo journalctl --vacuum-time=3d"
    [snap]="sudo snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision; do sudo snap remove "$snapname" --revision="$revision"; done"
  )

  for command in "${clean_commands[@]}"; do
    confirm_command "${command_names[$command]}" "${command_strings[$command]}"
  done
}

main
