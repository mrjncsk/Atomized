#!/bin/bash

set -ouex pipefail

# Enable Copr
 dnf5 -y copr enable ublue-os/staging

 # Terminal
 dnf5 -y install git tmux nvim mc git

 # System
 dnf5 -y install wayland weston wlroots libinput mesa-dri-drivers mesa-libGL mesa-libgbm mesa-libwayland-egl xdg-desktop-portal-wlr swaybg swaylock polkit pipewire pipewire-pulseaudio wireplumber xorg-xwayland psmisc dbus-x11 sddm

 # Desktop
 dnf5 -y install kitty

 # Disable Copr
 dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable sddm
systemctl enable pipewire
systemctl enable wireplumber
systemctl start sddm
systemctl start pipewire
systemctl start wireplumber
