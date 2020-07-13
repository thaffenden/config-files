#!/bin/sh
work_vpn_name="Vidsy Office"

home_vpn_is_active() {
  home_status=`expressvpn status` 
  if [[ "$home_status" == *"Not connected"* ]]; then
    echo "false"
  else
    echo "true"
  fi
}

home_off() {
  echo "disconnecting from home vpn..."
  `expressvpn disconnect &>/dev/null`
  echo "disconnected"
}

home_on() {
  echo "connecting to home vpn..."
  `expressvpn connect &>/dev/null`
  echo "connected!"
}

work_off() {
  echo "disconnecting from work vpn..."
  `nmcli con down "$work_vpn_name"`
  echo "disconnected"
}

work_on() {
  echo "connecting to work vpn ($work_vpn_name)"
  `nmcli con up "$work_vpn_name"`
  echo "connected!"
}

work_vpn_is_active() {
  work_status=`nmcli conn show --active`
  if [[ "$work_status" == *"$work_vpn_name"* ]]; then
    echo "true"
  else
    echo "false"
  fi
}

vpn_command() {
  case $1 in
    home)
      home_status=`toggle_home`
      echo "$home_status"
      ;;

    work)
      work_status=`work_vpn_is_active`
      echo "$work_status"
      ;;

    *)
      if [[ `home_vpn_is_active` == "true" ]]; then
        off=`home_off`
        sleep 3
        on=`work_on`

      elif [[ `work_vpn_is_active` == "true" ]]; then
        off=`work_off`
        sleep 1
        on=`home_on`

      else
        off="no vpn currently enabled"
        on=`home_on`

      fi

      echo $off
      echo $on
      ;;

  esac
}

alias vpn=vpn_command $@
