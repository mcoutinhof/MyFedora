#!/usr/bin/env bash
set -euxo pipefail

source ./repositories/rpmfusion.sh
source ./repositories/flathub.sh

source ./desktop/gnome.sh

source ./desktop/postinstall.sh

source ./internet/firefox.sh

source ./development/docker.sh
source ./development/vscode.sh
