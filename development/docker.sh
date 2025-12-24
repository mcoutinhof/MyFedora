#!/usr/bin/env bash

sudo dnf config-manager addrepo --from-repofile "https://download.docker.com/linux/fedora/docker-ce.repo"
sudo dnf install -y docker-ce
sudo systemctl enable --now docker

# Manage Docker as a non-root user
sudo groupadd -f docker
sudo usermod -aG docker "$USER"
