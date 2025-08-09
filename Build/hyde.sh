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
        NetworkManager \
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
        power-profiles-daemon \
        trash-cli \
        libinput \
        emoji-picker \
        cava \
        bat \
        duf \
        meson \
        ninja-build \
        rust \
        cargo \
        gcc \
        glib2-devel \
        --allowerasing

### Get HyDE Files
cd /tmp
git clone --depth 1 https://github.com/HyDE-Project/HyDE
mkdir -p /etc/skel/.config/
cp -Rf /tmp/HyDE /etc/skel/HyDE
cp -Rf /tmp/HyDE/Configs    /etc/skel/.config

### Install Sway OSD
git clone --depth 1 https://github.com/ErikReider/SwayOSD
cd SwayOSD
meson setup build
ninja -C build
meson install --prefix /usr -C build

### Remove Build Sowtware
dnf5 -y remove meson ninja-build rust cargo gcc glib2-devel

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
