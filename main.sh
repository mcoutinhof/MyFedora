#!/usr/bin/env bash
set -euxo pipefail

if [[ $EUID -eq 0 ]]; then
   echo "This script must not be run as root"
   exit 1
fi

source ./repositories/rpmfusion.sh
source ./repositories/flathub.sh

source ./desktop/gnome.sh

source ./desktop/postinstall.sh

source ./internet/firefox.sh

source ./development/docker.sh
source ./development/vscode.sh
