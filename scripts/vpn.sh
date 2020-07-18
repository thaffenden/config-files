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
  echo `expressvpn disconnect`
  echo "disconnected"
}

home_on() {
  echo "connecting to home vpn..."
  echo `expressvpn connect`
  echo "connected!"
}

work_off() {
  echo "disconnecting from work vpn..."
  echo `nmcli con down "$work_vpn_name"`
  echo "disconnected"
}

work_on() {
  echo "connecting to work vpn ($work_vpn_name)"
  echo `nmcli con up "$work_vpn_name"`
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
  home_status=`home_vpn_is_active`
  work_status=`work_vpn_is_active`


  case $1 in
    home)
      if [[ "$home_status" == "true" ]]; then
        echo "home vpn already enabled"

      elif [[ "$work_status" == "true" ]]; then
        echo `work_off`
        sleep 3
        echo `home_on`

      else
        echo `home_on`
      fi
      ;;

    work)
      if [[ "$work_status" == "true" ]]; then
        echo "work vpn already enabled"

      elif [[ "$home_status" == "true" ]]; then
        echo `home_off`
        sleep 3
        echo `work_on`

      else
        echo `work_on`
      fi
      ;;

    off)
      if [[ "$home_status" == "true" ]]; then
        echo `home_off`

      elif [[ "$work_status" == "true" ]]; then
        echo `work_off`

      else
        echo "no vpn currently active"
      fi
      ;;

    *)
      if [[ "$home_status" == "true" ]]; then
        echo "home vpn already enabled"

      elif [[ "$work_status" == "true" ]]; then
        echo `work_off`
        sleep 3
        echo `home_on`

      else
        echo `home_on`
      fi
      ;;

  esac
}

alias vpn=vpn_command $@
