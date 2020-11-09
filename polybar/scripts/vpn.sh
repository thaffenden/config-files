#! /bin/bash
if [[ `expressvpn status` != *"Not connected"* ]]; then
  echo '%{F#5CF19E}%{T4}  B   %{F- T-}'

elif [[ `nmcli con show --active` == *"Vidsy Office"* ]]; then
  echo '%{F#FF0657}%{T4}  C   %{F- T-}'

else
  echo '%{T2}%{F#FFD740} no vpn  %{F- T-}'
fi
