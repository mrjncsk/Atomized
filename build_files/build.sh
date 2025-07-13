#!/bin/bash

set -ouex pipefail

# Enable Copr
 dnf5 -y copr enable ublue-os/staging

# System
dnf5 -y install polkit pipewire pipewire-pulseaudio wireplumber psmisc sddm

# Display
dnf5 -y install weston wlroots libinput mesa-dri-drivers mesa-libGL \
      xorg-x11-server-Xwayland mesa-libgbm xdg-desktop-portal-wlr dbus-x11

 # Terminal
dnf5 -y install git tmux nvim mc git

# Desktop
dnf5 -y install hyprland swaybg swaylock

 # Apps
 dnf5 -y install kitty

 # Disable Copr
 dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
systemctl enable sddm.service
systemctl enable wireplumber.service
