#!/bin/bash
set -ouex pipefail

# Remove Steam Wallpapers
rm /usr/share/wallpapers/Steam*.*

# Remove Steam Autostart
rm /etc/skel/.config/autostart/steam.desktop

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

# Rebuild Initramfs
echo "::group::Executing build-initramfs"
trap 'echo "::endgroup::"' EXIT
QUALIFIED_KERNEL="$(dnf5 repoquery --installed --queryformat='%{evr}.%{arch}' kernel)"
/usr/bin/dracut --no-hostonly --kver "$QUALIFIED_KERNEL" --reproducible --zstd -v --add ostree -f "/usr/lib/modules/$QUALIFIED_KERNEL/initramfs.img"
chmod 0600 "/usr/lib/modules/$QUALIFIED_KERNEL/initramfs.img"
