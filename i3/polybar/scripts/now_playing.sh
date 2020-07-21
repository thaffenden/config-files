#! /bin/bash
json=`playerctl metadata --format '{"artist":"{{ artist }}","title":"{{ title }}","album":"{{ album }}","player":"{{ playerName }}"}' | jq .`
player=`jq '.player' <<< $json | awk -F'"' '$0=$2'`

case "$player" in
  "firefox")
    title=`jq '.title' <<< $json | awk -F'"' '$0=$2'`
    artist=$(echo "$title" | awk -F' - ' '$0=$1')

    if [[ "${title##* }" == "YouTube" ]]; then
      echo '%{F#FF5252}%{T3}%{F- T-}' "$(echo $title | awk 'BEGIN { ORS=" " }; {n=split($0,A," - "); for (i = 1; i <= n - 1; i++) print A[i]}')"
      break;
    fi

    song=$(echo "$title" | awk -F' - ' '$0=$2')
    echo '%{F#FFD740}%{T3}﮸%{F- T-}' "$artist - $song"
    ;;

  *)
    echo "$player"
    ;;

esac
