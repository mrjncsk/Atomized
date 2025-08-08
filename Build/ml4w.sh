#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable solopasha/hyprland

### Install Software
dnf5 -y install \
        wget \
        unzip \
        gum \
        rsync \
        git \
        figlet \
        xdg-user-dirs \
        hyprland \
        hyprpaper \
        hyprlock \
        hypridle \
        hyprpicker \
        google-noto-fonts-all \
        google-noto-emoji-fonts \
        google-noto-sans-cjk-fonts \
        google-noto-serif-cjk-fonts \
        xdg-desktop-portal-gtk \
        xdg-desktop-portal-hyprland \
        libnotify \
        kitty \
        qt5-qtwayland \
        qt6-qtwayland \
        fastfetch \
        python3-pip \
        python3-gobject \
        tumbler \
        brightnessctl \
        nm-connection-editor \
        network-manager-applet \
        ImageMagick \
        jq \
        xclip \
        neovim \
        htop \
        blueman \
        grim \
        slurp \
        cliphist \
        qt6ct \
        waybar \
        rofi-wayland \
        polkit \
        zsh \
        fzf \
        pavucontrol \
        papirus-icon-theme \
        plasma-breeze \
        flatpak \
        SwayNotificationCenter \
        gvfs \
        wlogout \
        waypaper \
        fontawesome-fonts-all \
        mozilla-fira-sans-fonts  \
        texlive-fira\
        fira-code-fonts  \
        dejavu-fonts-all  \
        nwg-dock-hyprland \
        power-profiles-daemon \
        vlc \
        --allowerasing

### Get ML4W Files
cd /tmp
git clone --depth 1 https://github.com/mylinuxforwork/dotfiles
mkdir -p /etc/skel/.config/
cp -Rf /tmp/mylinuxforwork/dotfiles/dotfiles /etc/skel/.config

#bibata-cursor-theme



### Disable Copr
dnf5 -y copr disable solopasha/hyprland
