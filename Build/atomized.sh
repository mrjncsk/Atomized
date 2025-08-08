#!/bin/bash
set -ouex pipefail

dnf5 -y install \
    mesa-vulkan-drivers \
    mesa-dri-drivers \
    libglvnd \
    fastfetch \
    cmatrix \
    kitty \
    nvim \
    tmux \
    mc 
