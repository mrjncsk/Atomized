#!/bin/bash
set -ouex pipefail

dnf5 -y install \
        mesa-vulkan-drivers \
        mesa-dri-drivers \
        plasma-breeze \
        libglvnd \
        fastfetch \
        cmatrix \
        zoxide \
        kitty \
        btop \
        nvim \
        tmux \
        lsd \
        mc
