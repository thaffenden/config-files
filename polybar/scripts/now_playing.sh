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
    if [[ "$song" != "" ]]; then
      echo '%{F#FFD740}%{T3}﮸%{F- T-}' "$artist - $song"
      break;
    fi

    if [[ `echo $artist | awk -F' | ' '$0=$1'` == "Slack" ]]; then
      echo '%{F#FF4081}%{T3}%{F- T-}' "$artist"
    fi

    echo '%{F#FFD740}%{T3}?%{F- T-}' "$artist"
    ;;

  "Plexamp")
    artist=`jq '.artist' <<< $json -r`
    song=`jq '.title' <<< $json -r`
    echo '%{F#FFD740}%{T3}﮸%{F- T-}' "$artist - $song"
    ;;

  *)
    echo "$player"
    ;;

esac
