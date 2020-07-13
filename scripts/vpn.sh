#!/bin/sh
export VPN_SCRIPT='true'

vpn_command() {
  case $1 in
    home)
      echo "home"
      ;;

    work)
      echo "work"
      ;;

    *)
      echo "unrecognised arguments $@ passed to VPN command"
      ;;
  esac
}

alias vpn=vpn_command $@
