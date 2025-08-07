#!/bin/bash
set -ouex pipefail

### Install Software
dnf5 -y install \
    kitty \
    nvim \
    mc \
    fastfetch
