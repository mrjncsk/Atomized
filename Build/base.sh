#!/bin/bash
set -ouex pipefail

### Install Base Software
dnf5 -y install \
    kitty nvim mc \
    wireplumber \
    sddm sddm-x11 sddm-kcm qt6-qtgraphicaleffects qt6-qtsvg qt6-qtquickcontrols2 \
    bluez \
    fastfetch \
    inotify-tools \
    qt6-qtdeclarative \
    ddcutil \
    cava \
    lm_sensors \
    glibc \
    grim \
    swappy \
    libqalculate \
    fuzzel \
    libnotify

### Enable Sddm
systemctl enable sddm
