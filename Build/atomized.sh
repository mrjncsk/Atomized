#!/bin/bash
set -ouex pipefail

dnf5 -y install \
        mesa-vulkan-drivers \
        mesa-dri-drivers \
        plasma-breeze \
        fastfetch \
        libglvnd \
        cmatrix \
        zoxide \
        kitty \
        btop \
        nvim \
        tmux \
        lsd \
        mc
