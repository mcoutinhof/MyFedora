#!/usr/bin/env bash
set -euxo pipefail

if [[ $EUID -eq 0 ]]; then
  echo "This script must not be run as root"
  exit 1
fi

# User Preferences
sudo dnf install -y newt

DESKTOP_ENVIRONMENT=$(whiptail --title "My Fedora" --notags \
  --menu "Select your preferred desktop environment:" 15 60 4 \
  "gnome" "GNOME Desktop (recommended)" \
  "plasma" "KDE Plasma Desktop" \
  3>&1 1>&2 2>&3)

USAGE_TYPES=$(whiptail --title "My Fedora" --notags \
  --checklist "Select your intended use: (SPACE to select)" 15 60 4 \
  "development" "Development" ON \
  "gaming" "Gaming" OFF \
  3>&1 1>&2 2>&3)

# Repositories
source ./repositories/rpmfusion.sh
source ./repositories/flathub.sh

# Dependencies
sudo dnf install -y curl tar pciutils

# Desktop Environment
case "$DESKTOP_ENVIRONMENT" in
"gnome") source ./desktop/gnome.sh ;;
"plasma") source ./desktop/plasma.sh ;;
esac

source ./desktop/postinstall.sh

# Applications
source ./internet/firefox.sh

# Development
if [[ $USAGE_TYPES == *"development"* ]]; then
  source ./development/docker.sh
  source ./development/jetbrains-toolbox.sh
  source ./development/vscode.sh
fi

# Gaming
if [[ $USAGE_TYPES == *"gaming"* ]]; then
  source ./gaming/steam.sh
fi
