#! /bin/bash
players=`playerctl --list-all`

if [[ $players == *"No players were found"* ]]; then
  echo ""
else
  echo `playerctl metadata --format '{{ artist }} - {{ title }} [{{ album }}]'`
fi

# might need custom handling for firefox not outputting data.
