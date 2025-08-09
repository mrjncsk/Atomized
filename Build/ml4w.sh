#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable peterwu/rendezvous
dnf5 -y copr enable tofik/nwg-shell
dnf5 -y copr enable erikreider/SwayNotificationCenter

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
        python3 \
        python3-gobject \
        python3-i3ipc \
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
        gtk3 \
        gsettings-qt \
        gtk-layer-shell \
        nwg-look \
        nwg-displays \
        swaync \
        --allowerasing

# ### Install Flatpaks
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# flatpak install --system -y \
#         com.ml4w.hyprlandsettings \
#         com.ml4w.settings \
#         com.ml4w.sidebar \
#         com.ml4w.welcome \
#         com.ml4w.dotfilesinstaller

### Get ML4W Files
cd /tmp
git clone --depth 1 https://github.com/mylinuxforwork/dotfiles
mkdir -p /etc/skel/.config/
cp -Rf /tmp/dotfiles/dotfiles /etc/skel/dotfiles
ln -s ../dotfiles/.config/hypr /etc/skel/.config/hypr
ln -s ../dotfiles/.config/bashrc /etc/skel/.config/bashrc
ln -s ../dotfiles/.config/dunst /etc/skel/.config/dunst
ln -s ../dotfiles/.config/fastfetch /etc/skel/.config/fastfetch
ln -s ../dotfiles/.config/gtk-3.0 /etc/skel/.config/gtk-3.0
ln -s ../dotfiles/.config/gtk-4.0 /etc/skel/.config/gtk-4.0
ln -s ../dotfiles/.config/kitty /etc/skel/.config/kitty
ln -s ../dotfiles/.config/matugen /etc/skel/.config/matugen
ln -s ../dotfiles/.config/ml4w /etc/skel/.config/ml4w
ln -s ../dotfiles/.config/nvim /etc/skel/.config/nvim
ln -s ../dotfiles/.config/nwg-dock-hyprland /etc/skel/.config/nwg-dock-hyprland
ln -s ../dotfiles/.config/ohmyposh /etc/skel/.config/ohmyposh
ln -s ../dotfiles/.config/qt6ct /etc/skel/.config/qt6ct
ln -s ../dotfiles/.config/rofim /etc/skel/.config/rofim
ln -s ../dotfiles/.config/swaync /etc/skel/.config/swaync
ln -s ../dotfiles/.config/vim /etc/skel/.config/vim
ln -s ../dotfiles/.config/wal /etc/skel/.config/wal
ln -s ../dotfiles/.config/wallust /etc/skel/.config/wallust
ln -s ../dotfiles/.config/waybar /etc/skel/.config/waybar
ln -s ../dotfiles/.config/waypaper /etc/skel/.config/waypaper
ln -s ../dotfiles/.config/waylogout /etc/skel/.config/waylogout
ln -s ../dotfiles/.config/xsettingsd /etc/skel/.config/xsettingsd
ln -s ../dotfiles/.config/zshrc /etc/skel/.config/zshrc

# ### Inmstall ML4W Calandar
# cd /tmp
# git clone --depth 1 https://github.com/mylinuxforwork/dotfiles-calendar/
# cd dotfiles-calendar
# ./setup.sh

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable peterwu/rendezvous
dnf5 -y copr disable tofik/nwg-shell
dnf5 -y copr disable erikreider/SwayNotificationCenter
