#!/bin/bash

set -ouex pipefail

# Enable Copr
 dnf5 -y copr enable ublue-os/staging

 # Terminal
 dnf5 -y install git tmux nvim mc git

 # System
 dnf5 -y install hyprland

 # Desktop
 dnf5 -y install kitty

 # Disable Copr
 dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
