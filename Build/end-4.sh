#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable errornointernet/quickshell
dnf5 -y copr enable atim/starship

### Install Software
dnf5 -y install \
        hyprland \
        hypridle \
        hyprlock \
        hyprpm \
        dolphin \
        kitty \
        wl-clipboard \
        fcitx5 \
        gnome-keyring \
        polkit \
        qt6-qtpositioning \
        fish \
        sddm \
        xdg-desktop-portal-hyprland \
        quickshell-git \
        starship

### Get end-4 Files
cd /tmp
git clone --depth 1 https://github.com/end-4/dots-hyprland
mkdir -p /etc/skel/.config /etc/skel/.local
cp -Rf /tmp/dots-hyprland/.config /etc/skel/
cp -Rf /tmp/dots-hyprland/.local /etc/skel/

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable errornointernet/quickshell
dnf5 -y copr disable atim/starship

### Enamble SDDM
systemctl enable sddm
