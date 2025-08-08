#!/bin/bash
set -ouex pipefail

dnf5 -y install \
    mesa-dri-drivers \
    mesa-vulkan-drivers \
    libglvnd \
    kitty \
    nvim \
    mc \
    fastfetch
