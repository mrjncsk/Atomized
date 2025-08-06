#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable heus-sueh/packages

### Install Software
dnf5 -y install hyprland xdg-desktop-portal-hyprland hyprpanel thunar
dnf5 -y install wireplumber upower libgtop2 bluez bluez-tools grimblast hyprpicker btop NetworkManager wl-clipboard swww brightnessctl gnome-bluetooth aylurs-gtk-shell power-profiles-daemon gvfs nodejs wf-recorder
npm install -g sass
dnf5 -y install python python3-pip
pip install gpustat pywal
dnf5 -y install greetd tuigreet

### Install Greeter
#

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable heus-sueh/packages

system### Enable Greeter
ctl enable --now greetd
