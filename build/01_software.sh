#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable ublue-os/staging
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable atim/starship
dnf5 -y copr enable errornointernet/quickshell

### Install required Software
dnf5 -y install \
    kitty nvim mc \
    hyprland hypridle hyprshot hyprlock \
    hyprland-qtutils hyprpanel \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    matugen \
    swww \
    wofi \
    fish \
    quickshell-git \
    wireplumber \
    wl-clipboard \
    btop \
    jq \
    socat \
    ImageMagick \
    bluez \
    inotify-tools \
    trash-cli \
    starship \
    adw-gtk3-theme \
    qt5-qtwayland \
    qt6-qtwayland \
    qt5ct qt6ct \
    qt6-qtdeclarative \
    jetbrains-mono-fonts-all \
    ddcutil \
    brightnessctl \
    cava \
    NetworkManager \
    lm_sensors \
    aubio aubio-devel \
    glibc \
    grim \
    swappy \
    libqalculate \
    fuzzel \
    python3-build python3-installer \
    python3-hatchling python3-hatch-vcs \
    pipewire-libs pipewire-devel \
    libnotify
