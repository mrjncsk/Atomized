#!/bin/bash
set -ouex pipefail

### Remove Steam Autostart
rm -f /etc/skel/.config/autostart/steam.desktop

### Remove Wallpapers
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

### OS Release
sed -i \
    -e 's/^NAME=.*/NAME="Atomized"/' \
    -e 's/^PRETTY_NAME=.*/PRETTY_NAME="Atomized (from Ublue)"/' \
    -e 's/^LOGO=.*/LOGO=atomized-logo-icon/' \
    -e 's/^DEFAULT_HOSTNAME=.*/DEFAULT_HOSTNAME="atomized"/' \
    -e 's/^HOME_URL=.*/HOME_URL="https:\/\/github.com\/mrjncsk\/atomized"/' \
    -e 's/^BOOTLOADER_NAME=.*/BOOTLOADER_NAME="atomized"/' \
/usr/lib/os-release

### Rebuild Initramfs
QUALIFIED_KERNEL="$(dnf5 repoquery --installed --queryformat='%{evr}.%{arch}' kernel)"
/usr/bin/dracut --no-hostonly --kver "$QUALIFIED_KERNEL" --reproducible --zstd -v --add ostree -f "/usr/lib/modules/$QUALIFIED_KERNEL/initramfs.img"
chmod 0600 "/usr/lib/modules/$QUALIFIED_KERNEL/initramfs.img"
