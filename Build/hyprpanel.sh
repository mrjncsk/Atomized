#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable heus-sueh/packages

### Install Software
dnf5 -y install \
    hyprland \
    hypridle \
    hyprlock \
    hyprpanel \
    hyprshot \
    hyprpicker \
    hyprland-qtutils \
    wofi \
    matugen \
    swww \
    xdg-desktop-portal-hyprland \
    thunar \
    wireplumber \
    upower \
    libgtop2 \
    bluez \
    bluez-tools \
    grimblast \
    btop \
    NetworkManager \
    wl-clipboard \
    brightnessctl \
    gnome-bluetooth \
    aylurs-gtk-shell2 \
    power-profiles-daemon \
    gvfs \
    nodejs \
    wf-recorder \
    python python3-pip \
    greetd tuigreet \
    --allowerasing
pip install --prefix=/usr --root-user-action=ignore gpustat pywal
npm install --prefix /usr -g sass

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable heus-sueh/packages

system### Enable Greeter
ctl enable greetd
