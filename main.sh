#!/usr/bin/env bash
set -euxo pipefail

if [[ $EUID -eq 0 ]]; then
  echo "This script must not be run as root"
  exit 1
fi

# Dependencies
sudo dnf install -y newt pciutils

DESKTOP_ENVIRONMENT=$(whiptail --title "My Fedora" --notags \
  --menu "Select you preferred desktop environment:" 15 60 4 \
  "gnome" "GNOME Desktop (recommended)" \
  "plasma" "KDE Plasma Desktop" \
  3>&1 1>&2 2>&3)

source ./repositories/rpmfusion.sh
source ./repositories/flathub.sh

case "$DESKTOP_ENVIRONMENT" in
"gnome") source ./desktop/gnome.sh ;;
"plasma") source ./desktop/plasma.sh ;;
esac

source ./desktop/postinstall.sh

source ./internet/firefox.sh

source ./development/docker.sh
source ./development/vscode.sh

source ./gaming/steam.sh
