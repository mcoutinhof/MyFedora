#!/usr/bin/env bash

(
  declare -r PACKAGES=(
    plasma-desktop       # Base desktop environment
    plasma-login-manager # Login manager

    konsole              # Terminal emulator
    dolphin              # File manager
    ark                  # Archive manager
    plasma-systemmonitor # System monitor
    kde-partitionmanager # Partition manager
    kjournald            # Log viewer
    filelight            # Disk usage analyzer

    kcalc                # Calculator
    kwrite               # Text editor
    okular               # Document viewer
    gwenview             # Image viewer
    elisa-player         # Audio player
    dragon               # Video player
  )

  sudo dnf install -y "${PACKAGES[@]}"

  sudo systemctl set-default graphical.target
)
