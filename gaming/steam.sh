#!/usr/bin/env bash

sudo dnf install -y steam

# Required for Steam Overlay to display NVIDIA GPU info
if lspci | grep -Eqi '(VGA|3D).*(NVIDIA)'; then
  sudo dnf install -y xorg-x11-drv-nvidia-cuda-libs.i686
fi

# Proton Version Manager
flatpak install -y flathub net.davidotek.pupgui2
