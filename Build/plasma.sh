#!/bin/bash
set -ouex pipefail

### Install Software
dnf5 -y install \
    plasma-desktop \
    dolphin \
    systemsettings \
    kwin \
    kwin-wayland \
    plasma-workspace \
    sddm-wayland-plasma \
    kde-settings \
    plasma-nm \
    kscreen \
    wlroots

### Enable Sddm
systemctl enable sddm
