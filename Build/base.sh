#!/bin/bash
set -ouex pipefail

### Install required Software
dnf5 -y install \
    kitty nvim mc \
    wireplumber \
    bluez \
    inotify-tools \
    trash-cli \
    adw-gtk3-theme \
    qt5ct qt6ct \
    qt6-qtdeclarative \
    jetbrains-mono-fonts-all \
    ddcutil \
    cava \
    lm_sensors \
    glibc \
    grim \
    swappy \
    libqalculate \
    fuzzel \
    libnotify
