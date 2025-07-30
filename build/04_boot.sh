#!/bin/bash
set -ouex pipefail

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
