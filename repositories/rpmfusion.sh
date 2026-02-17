#!/usr/bin/env bash

sudo dnf install -y \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"

sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# AppStream metadata
sudo dnf install -y rpmfusion-\*-appstream-data

# Switch to full ffmpeg
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing

# Install additional codec
sudo dnf group install -y multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin

# Hardware Accelerated Codec
sudo dnf swap -y mesa-va-drivers.x86_64 mesa-va-drivers-freeworld.x86_64
sudo dnf swap -y mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686

sudo dnf install -y \
    intel-media-driver \
    libva-intel-driver \
    libva-nvidia-driver.{i686,x86_64}
