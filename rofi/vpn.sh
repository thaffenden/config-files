#! /bin/zsh
if [[ -z "$@" ]]; then
  echo "home"
  echo "work"
  echo "off"
else
  source /home/tristan/git/config-files/scripts/vpn.sh
  vpn_command $@ > /dev/null
  exit 0
fi
