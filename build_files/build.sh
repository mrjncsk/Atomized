#!/bin/bash
set -ouex pipefail

# to workarround gnupg error on build, gpg: Fatal: can't create directory '/root/.gnupg': No such file or directory
mkdir -p /root/.gnupg

# Enable Copr
dnf5 -y copr enable ublue-os/staging

# Install Software
dnf5 -y install \
    hyprland \
    waybar \
    kitty \
    mc

# Disable Copr
dnf5 -y copr disable ublue-os/staging

# Services
systemctl enable podman.socket
