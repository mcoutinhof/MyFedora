#!/usr/bin/env bash

(
  declare -r PACKAGES=(
    plasma-desktop       # Base desktop environment
    sddm sddm-breeze     # Login manager

    konsole              # Terminal emulator
    dolphin              # File manager
    ark                  # Archive manager
    plasma-systemmonitor # System monitor
    kde-partitionmanager # Partition manager
    ksystemlog           # Log viewer
    filelight            # Disk usage analyzer

    kcalc                # Calculator
    kate                 # Text editor
    okular               # Document viewer
    gwenview             # Image viewer
    elisa-player         # Audio player
    dragon               # Video player
  )

  sudo dnf install -y "${PACKAGES[@]}"

  sudo systemctl set-default graphical.target
)
