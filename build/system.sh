#!/bin/bash
set -ouex pipefail

rm /usr/share/wallpapers/*.*
rm /etc/skel/.config/autostart/steam.desktop

sed -i \
    -e 's/^NAME=.*/NAME="hyprblue"/' \
    -e 's/^ID=.*/ID=hyprblue/' \
    -e 's/^PRETTY_NAME=.*/PRETTY_NAME="hyprblue Atomic OS"/' \
    -e 's/^LOGO=.*/LOGO=hyprblue-logo-icon/' \
    -e 's|^CPE_NAME=.*|CPE_NAME="cpe:/o:universal-blue:hyprblue:42"|' \
    -e 's/^DEFAULT_HOSTNAME=.*/DEFAULT_HOSTNAME=hyprblue/' \
    -e 's|^HOME_URL=.*|HOME_URL="https://github.com/mrjncsk/hyprblue"|' \
    -e 's|^DOCUMENTATION_URL=.*|DOCUMENTATION_URL="https://github.com/mrjncsk/hyprblue"|' \
    -e 's|^SUPPORT_URL=.*|SUPPORT_URL="https://github.com/mrjncsk/hyprblue"|' \
    -e 's|^BUG_REPORT_URL=.*|BUG_REPORT_URL="https://github.com/mrjncsk/hyprblue/issues"|' \
    -e 's/^BOOTLOADER_NAME=.*/BOOTLOADER_NAME="hyprblue"/' \
    /usr/lib/os-release

# Enable Copr
dnf5 -y copr enable ublue-os/staging
dnf5 -y copr enable solopasha/hyprland

# Install Software
dnf5 -y install \
    hyprland \
    hyprland-qtutils \
    hypridle \
    hyprshot \
    hyprlock \
    xdg-desktop-portal-hyprland \
    hyprpanel \
    waybar \
    matugen \
    swww \
    wofi \
    kitty \
    nvim \
    mc

# Disable Copr
dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable solopasha/hyprland

# Services
systemctl enable podman.socket
