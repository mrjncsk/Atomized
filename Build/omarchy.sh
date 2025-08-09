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
        gtk4-layer-shell \
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
        vips \
        swayosd

### Get Omarchy Files
cd /tmp
git clone --depth 1 https://github.com/basecamp/omarchy
mkdir -p /etc/skel/.config/omarchy/themes /etc/skel/.config/omarchy/current  /etc/skel/.local/share
cp -Rf /tmp/omarchy/ /etc/skel/.local/share/omarchy
cp -Rf /tmp/omarchy/config /etc/skel/.config
ln -s ../../../.local/share/omarchy/themes/tokyo-night /etc/skel/.config/omarchy/themes/tokyo-night
ln -s ../../../.local/share/omarchy/themes/rose-pine /etc/skel/.config/omarchy/themes/rose-pine
ln -s ../../../.local/share/omarchy/themes/ristretto /etc/skel/.config/omarchy/themes/ristretto
ln -s ../../../.local/share/omarchy/themes/osaka-jade /etc/skel/.config/omarchy/themes/osaka-jade
ln -s ../../../.local/share/omarchy/themes/nord /etc/skel/.config/omarchy/themes/nord
ln -s ../../../.local/share/omarchy/themes/matte-black /etc/skel/.config/omarchy/themes/matte-black
ln -s ../../../.local/share/omarchy/themes/kanagawa /etc/skel/.config/omarchy/themes/kanagawa
ln -s ../../../.local/share/omarchy/themes/gruvbox /etc/skel/.config/omarchy/themes/gruvbox
ln -s ../../../.local/share/omarchy/themes/everforest /etc/skel/.config/omarchy/themes/everforest
ln -s ../../../.local/share/omarchy/themes/catppuccin-latte /etc/skel/.config/omarchy/themes/catppuccin-latte
ln -s ../../../.local/share/omarchy/themes/catppuccin /etc/skel/.config/omarchy/themes/catppuccin
ln -s ../themes/tokyo-night /etc/skel/.config/omarchy/current/theme
ln -s theme/backgrounds/1-scenery-pink-lakeside-sunset-lake-landscape-scenic-panorama-7680x3215-144.png \
    /etc/skel/.config/omarchy/current/background
#cp -Rf /tmp/omarchy/bin
#cp -Rf /tmp/omarchy/default
#cp -Rf /tmp/omarchy/applications

### Install Walker
LATEST_URL=$(curl -s https://api.github.com/repos/abenz1267/walker/releases/latest \
  | grep browser_download_url \
  | grep Linux_x86_64.tar.gz \
  | cut -d '"' -f 4)
curl -LO "$LATEST_URL"
TARFILE=$(basename "$LATEST_URL")
read -r FIRST_ENTRY < <(tar -tf "$TARFILE")
DIRNAME=${FIRST_ENTRY%/}
tar -xzf "$TARFILE"
cp "$DIRNAME/walker" /usr/bin/
chmod +x /usr/bin/walker
rm -rf "$TARFILE" "$DIRNAME"

# ### Build Walker
# cd /tmp
# git clone --depth 1 https://github.com/abenz1267/walker
# cd walker/cmd
# mkdir -p /tmp/go /tmp/go-build-cache
# export GOCACHE=/tmp/go-build-cache
# export GOPATH=/tmp/go
# go build -x -o walker
# cp walker /usr/bin/

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable markupstart/SwayOSD
