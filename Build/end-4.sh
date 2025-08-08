#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable errornointernet/quickshell

### Install Software
dnf5 -y install \
hyprland \
xdg-desktop-portal-hyprland \
quickshell-git

### Get end-4 Files
cd /tmp
git clone --depth 1 https://github.com/end-4/dots-hyprland
mkdir -p /etc/skel/.config /etc/skel/.local
cp -Rf /tmp/dots-hyprland/.config /etc/skel/
cp -Rf /tmp/dots-hyprland/.local /etc/skel/

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable errornointernet/quickshell
