#! /bin/bash
json=`playerctl metadata --format '{"artist":"{{ artist }}","title":"{{ title }}","album":"{{ album }}","player":"{{ playerName }}"}' | jq .`
player=`jq '.player' -r <<< $json`

case "$player" in
  "firefox")
    playChar="▶ "
    title=`jq '.title' -r <<< $json`
    title=${title#"$playChar"}
    artist=$(echo "$title" | awk -F' - ' '$0=$1')

    if [[ "${title##* }" == "YouTube" ]]; then
      echo '%{F#FF5252}%{T3}%{F- T-}' "$(echo $title | awk 'BEGIN { ORS=" " }; {n=split($0,A," - "); for (i = 1; i <= n - 1; i++) print A[i]}')"
      exit 0;
    fi

    song=$(echo "$title" | awk -F' - ' '$0=$2')
    if [[ "$song" != "" ]]; then
      echo '%{F#FFD740}%{T3}﮸%{F- T-}' "$artist - $song"
      exit 0;
    fi

    if [[ `echo $artist | awk -F' | ' '$0=$1'` == "Slack" ]]; then
      echo '%{F#FF4081}%{T3}%{F- T-}' "$artist"
      exit 0;
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
