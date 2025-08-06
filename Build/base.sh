#!/bin/bash
set -ouex pipefail

### Install Base Software
dnf5 -y install \
    kitty nvim mc \
    wireplumber \
    sddm sddm-wayland-generic sddm-wayland-plasma sddm-kcm qt6-qtsvg qt6-qtquickcontrols2 \
    qt6-qtbase qt6-qtdeclarative qt6-qtbase-gui qt6-qtquick \
    bluez \
    fastfetch \
    inotify-tools \
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
