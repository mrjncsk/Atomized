#!/bin/bash
set -ouex pipefail

### Install required Software
dnf5 -y install \
    plasma-desktop \
    dolphin \
    systemsettings \
    kwin \
    plasma-workspace \
    kde-settings \
    plasma-nm \
    kscreen \
    sddm

sudo systemctl enable sddm
