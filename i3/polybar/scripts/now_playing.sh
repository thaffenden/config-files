#! /bin/bash
json=`playerctl metadata --format '{"artist":"{{ artist }}","title":"{{ title }}","album":"{{ album }}","player":"{{ playerName }}"}' | jq .`
player=`jq '.player' <<< $json | awk -F'"' '$0=$2'`

case "$player" in
  "firefox")
    title=`jq '.title' <<< $json`
    artist=$(echo "$title" | awk -F'"' '$0=$2' | awk -F' - ' '$0=$1')
    song=$(echo "$title" | awk -F'"' '$0=$2' | awk -F' - ' '$0=$2')

    case "$song" in
      "YouTube")
        echo " $artist"
        ;;

      *)
        echo "$artist - $song"
        ;;
    esac
    ;;

  *)
    echo "$player"
    # echo `playerctl metadata --format '{"artist":"{{ artist }}","title":"{{ title }}","album":"{{ album }}","player":"{{ playerName }}"}'`
    ;;

esac
# might need custom handling for firefox not outputting data.
