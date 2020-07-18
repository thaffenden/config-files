#!/bin/sh
work_vpn_name="Vidsy Office"


# Use in format `log_connecting vpn_type message`.
log_connecting() {
  printf "\e[0m\e[1m\e[32m[🔐 vpn - $1]\e[0m $2\n\e[2m"
}

log_disconnecting() {
  printf "\e[0m\e[1m\e[35m[🔓 vpn - $1]\e[0m $2\n\e[2m"
}

home_vpn_is_active() {
  home_status=`expressvpn status` 
  if [[ "$home_status" == *"Not connected"* ]]; then
    echo "false"
  else
    echo "true"
  fi
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
        log_connecting "home" "home vpn already enabled"

      elif [[ "$work_status" == "true" ]]; then
        log_disconnecting "work" "disconnecting from work vpn..."
        disconnect=`nmcli con down "$work_vpn_name"`
        log_disconnecting "work" "$disconnect"
        sleep 3
        log_connecting "home" "connecting to home vpn..."
        connect=`expressvpn connect`
        log_connecting "home" "$connect"

      else
        log_connecting "home" "connecting to home vpn..."
        connect=`expressvpn connect`
        log_connecting "home" "$connect"
      fi
      ;;

    work)
      if [[ "$work_status" == "true" ]]; then
        log_connecting "work" "work vpn already enabled"

      elif [[ "$home_status" == "true" ]]; then
        log_disconnecting "home" "disconnecting from home vpn..."
        disconnect=`expressvpn disconnect`
        log_disconnecting "home" "$disconnect"
        sleep 4
        log_connecting "work" "connecting to work vpn..."
        connect=`nmcli con up "$work_vpn_name"`
        log_connecting "work" "$connect"

      else
        log_connecting "work" "connecting to work vpn..."
        connect=`nmcli con up "$work_vpn_name"`
        log_connecting "work" "$connect"
      fi
      ;;

    off)
      if [[ "$home_status" == "true" ]]; then
        log_disconnecting "home" "disconnecting from home vpn..."
        disconnect=`expressvpn disconnect`
        log_disconnecting "home" "$disconnect"

      elif [[ "$work_status" == "true" ]]; then
        log_disconnecting "work" "disconnecting from work vpn..."
        disconnect=`nmcli con down "$work_vpn_name"`
        log_disconnecting "work" "$disconnect"

      else
        log_disconnecting "none" "⚠️ no vpn currently active"
      fi
      ;;

    *)
      if [[ "$home_status" == "true" ]]; then
        log_connecting "home"  "home vpn already enabled"

      elif [[ "$work_status" == "true" ]]; then
        log_disconnecting "work" "disconnecting from work vpn..."
        disconnect=`nmcli con down "$work_vpn_name"`
        log_disconnecting "work" "$disconnect"
        sleep 4
        log_connecting "home" "connecting to home vpn..."
        connect=`expressvpn connect`
        log_connecting "home" "$connect"

      else
        log_connecting "home" "connecting to home vpn..."
        connect=`expressvpn connect`
        log_connecting "home" "$connect"
      fi
      ;;

  esac
}

alias vpn=vpn_command $@
