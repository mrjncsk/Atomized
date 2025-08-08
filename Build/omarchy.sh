#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable solopasha/hyprland

### Install Software
dnf5 -y install \
        brightnessctl \
        playerctl \
        pamixer \
        wireplumber \
        fcitx5 \
        fcitx5-gtk \
        fcitx5-qt \
        nautilus \
        sushi \
        ffmpegthumbnailer \
        gvfs-mtp \
        slurp \
        mpv \
        evince \
        imv \
        chromium \
        fontawesome-fonts-all \
        cascadia-code-fonts \
        google-noto-fonts-all \
        google-noto-emoji-fonts \
        hyprland \
        hyprshot \
        hyprpicker \
        hyprlock \
        hypridle \
        hyprsunset \
        polkit \
        hyprland-qtutils \
        libqalculate \
        waybar \
        mako \
        swaybg \
        xdg-desktop-portal-hyprland \
        xdg-desktop-portal-gtk

### Get Omarchy Files
cd /tmp
git clone --depth 1 https://github.com/basecamp/omarchy
ls -Rla /tmp/omarchy
mkdir -p /etc/skel/.config /etc/skel/.local/bin
cp -Rf /tmp/basecamp/omarchy/config /etc/skel/.config
cp -Rf /tmp/basecamp/omarchy/bin /etc/skel/.local/bin
#cp -Rf /tmp/basecamp/omarchy/applications
#cp -Rf /tmp/basecamp/omarchy/themes
#cp -Rf /tmp/basecamp/omarchy/default

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
