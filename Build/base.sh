#!/bin/bash
set -ouex pipefail

### Install Base Software
dnf5 -y install \
    kitty nvim mc \
    wireplumber \
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
