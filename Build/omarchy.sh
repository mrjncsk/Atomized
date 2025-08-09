#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable markupstart/SwayOSD

### Install Software
dnf5 -y install \
        alacritty \
        chromium \
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
        xdg-desktop-portal-gtk \
        golang \
        gcc \
        swayosd

### Get Omarchy Files
cd /tmp
git clone --depth 1 https://github.com/basecamp/omarchy
mkdir -p /etc/skel/.config /etc/skel/.local/share
cp -Rf /tmp/omarchy/ /etc/skel/.local/share/omarchy
cp -Rf /tmp/omarchy/config /etc/skel/.config
#cp -Rf /tmp/omarchy/applications /etc/skel/.local/share/applications
#cp -Rf /tmp/omarchy/bin
#cp -Rf /tmp/omarchy/themes
#cp -Rf /tmp/omarchy/default

### Install Walker
cd /tmp
git clone --depth 1 https://github.com/abenz1267/walker
cd walker/cmd
mkdir -p /tmp/go-build-cache
export GOCACHE=/tmp/go-build-cache
go build -x -o walker
cp walker /usr/bin/

### Remove Build Software
dnf5 -y remove golang gcc

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable markupstart/SwayOSD
