#!/bin/bash
set -ouex pipefail

### Hyprland Config
sed -i 's|^exec-once = .*/polkit-.*authentication-agent.*$|exec-once = /usr/libexec/kf6/polkit-kde-authentication-agent-1|' /etc/skel/.config/hypr/hyprland/exec.conf

### OS Release
sed -i \
    -e 's/^NAME=.*/NAME="Atomized"/' \
    -e 's/^PRETTY_NAME=.*/PRETTY_NAME="Atomized (from Ublue)"/' \
    -e 's/^LOGO=.*/LOGO=atomized-logo-icon/' \
    -e 's/^DEFAULT_HOSTNAME=.*/DEFAULT_HOSTNAME="atomized"/' \
    -e 's/^HOME_URL=.*/HOME_URL="https:\/\/github.com\/mrjncsk\/atomized"/' \
    -e 's/^BOOTLOADER_NAME=.*/BOOTLOADER_NAME="atomized"/' \
/usr/lib/os-release
