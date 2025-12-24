#!/usr/bin/env bash

sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub "https://dl.flathub.org/repo/flathub.flatpakrepo"
flatpak install -y flathub com.github.tchx84.Flatseal
