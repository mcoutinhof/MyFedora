#!/usr/bin/env bash

sudo dnf install -y \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf install -y rpmfusion-\*-appstream-data

sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing
