#!/bin/bash
set -ouex pipefail

### Remove Build Software
dnf5 -y remove \
    python3-build python3-installer \
    python3-hatchling python3-hatch-vcs \
    aubio-devel \
    pipewire-devel

### Disable Copr
dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable atim/starship
dnf5 -y copr disable errornointernet/quickshell

### Remove Steam Autostart
rm -f /etc/skel/.config/autostart/steam.desktop

### Remove Steam Wallpapers
rm -f /usr/share/wallpapers/*.*
rm -f /usr/share/hypr/wall2.png

### Remove Color Schemes
rm -f /usr/share/color-schemes/VGUI.colors
rm -f /usr/share/color-schemes/Vapor.colors

### Remove Themes
rm -Rf /usr/share/plasma/look-and-feel/com.valve.vapor.desktop
rm -Rf /usr/share/plasma/look-and-feel/com.valve.vgui.desktop
rm -Rf /usr/share/plasma/look-and-feel/org.fedoraproject.dedpra.desktop
rm -Rf /usr/share/sddm/themes/01-breeze-fedora
rm -Rf /usr/share/plymouth/themes/bgrt
rm -Rf /usr/share/plymouth/themes/charge
rm -Rf /usr/share/plymouth/themes/details
rm -Rf /usr/share/plymouth/themes/text
rm -Rf /usr/share/plymouth/themes/tribar
