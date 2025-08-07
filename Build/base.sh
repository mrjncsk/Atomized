#!/bin/bash
set -ouex pipefail

### Install Base Software
dnf5 -y install \
    mesa-dri-drivers \
    mesa-vulkan-drivers \
    vulkan-loader \
    libglvnd \
    libva \
    libva-utils \
    libvdpau \
    libdrm \
    libX11 \
    xorg-x11-server-Xorg \
    xorg-x11-drv-amdgpu \
    xorg-x11-drv-ati \
    xorg-x11-drv-intel \
    xorg-x11-drv-nouveau \
    xorg-x11-drv-vesa \
    xorg-x11-drv-vmware \
    glx-utils \
    kitty nvim mc \
    wireplumber \
    qt6-qtsvg \
    qt6-qtquickcontrols2 \
    qt6-qtbase \
    qt6-qtdeclarative \
    qt6-qtbase-gui \
    qt5-qtwayland \
    qt6-qtwayland \
    qt5ct \
    qt6ct \
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
