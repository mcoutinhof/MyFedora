#!/usr/bin/env bash

(
  declare -r PACKAGES=(
    cinnamon                # Base desktop environment
    lightdm                 # Login manager

    gnome-terminal          # Terminal emulator
    nemo                    # File manager
    file-roller             # Archive manager
    gnome-system-monitor    # System monitor
    gnome-disk-utility      # Partition manager
    gnome-logs              # Log viewer
    baobab                  # Disk usage analyzer

    gnome-calculator        # Calculator
    xed                     # Text editor
    xreader                 # Document viewer
    eom                     # Image viewer
    rhythmbox               # Audio player
    celluloid               # Video player
  )

  sudo dnf install -y "${PACKAGES[@]}"

  sudo systemctl set-default graphical.target
)
