#!/bin/bash
set -ouex pipefail

# Enable Copr
dnf5 -y copr enable ublue-os/staging

# Install Software
dnf5 -y install \
    hyprland \
    kitty \
    mc

# Disable Copr
dnf5 -y copr disable ublue-os/staging

# Services
systemctl enable podman.socket
