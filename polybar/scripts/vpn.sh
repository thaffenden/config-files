#! /bin/bash
if [[ `expressvpn status` != *"Not connected"* ]]; then
  echo '%{T2}%{B#5CF19E}%{F#263238} vpn: %{T-}%{T4}A  %{B- F- T-}'

elif [[ `nmcli con show --active` == *"Vidsy Office"* ]]; then
  echo '%{T2}%{B#FF0657} vpn: %{T-}%{T4}B  %{B- F- T-}'

else
  echo '%{T2}%{B#FFD740}%{F#263238} vpn: none  %{B- F- T-}'
fi
