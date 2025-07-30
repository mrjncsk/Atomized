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
