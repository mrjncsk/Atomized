#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable solopasha/hyprland

### Install Software
dnf5 -y install \
        pipewire \
        pipewire-alsa \
        pipewire-jack-audio-connection-kit \
        pipewire-plugin-jack \
        wireplumber \
        pavucontrol \
        pamixer \
        networkmanager \
        network-manager-applet \
        bluez \
        bluez-tools \
        blueman \
        brightnessctl \
        playerctl \
        udiskie \
        sddm \
        qt5-qtquickcontrols \
        qt5-qtquickcontrols2 \
        hyprland \
        dunst \
        rofi-wayland \
        waybar \
        swww \
        hyprlock \
        wlogout \
        grim \
        hyprpicker \
        slurp \
        hyprsunset \
        polkit \
        xdg-desktop-portal-hyprland \
        xdg-desktop-portal-gtk \
        xdg-user-dirs \
        parallel \
        jq \
        ImageMagick \
        ffmpegthumbs \
        kde-cli-tools \
        libnotify \
        google-noto-emoji-fonts  \
        qt5ct \
        qt6ct \
        kvantum \
        kvantum-qt5 \
        qt5-qtwayland \
        qt6-qtwayland \
        firefox \
        kitty \
        dolphin \
        ark \
        unzip \
        vim \
        fzf \
        duf \
        fastfetch \
        hypridle \
        python3-requests \
        ddcui \
        power-profiles-daemon

# downgrade                # downgrade packages
# trash-cli-git            # cli to manage trash files
# libinput-gestures        # actions touchpad gestures using libinput
# gestures                 # gui for libinput-gestures

### extra
# xdg-desktop-portal-gtk     # xdg desktop portal using gtk
# wf-recorder              # Screen recorder for wlroots-based compositors such as sway
# # emote                    # emoji picker gtk3
# # wl-screenrec             # High performance hardware accelerated wlroots screen recorder // NO support for NVIDIA
# cava                       # audio visualizer
# bat|zsh                      # enhanced version of cat
# eza|zsh                      # file lister for zsh
# duf|zsh                      # prettier version of df for zsh
# swayosd-git                 #A GTK based on screen display for keyboard shortcuts like caps-lock and volume

### Get HyDE Files
cd /tmp
git clone --depth 1 https://github.com/HyDE-Project/HyDE
mkdir -p /etc/skel/.config/
cp -Rf /tmp/HyDE/Configs /etc/skel/.config

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
