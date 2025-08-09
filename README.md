![Logo](Data/atomized/usr/share/atomized/Logo.png)

# Atomized Desktop Environments

Atomizing some Desktop Environments with Fedora Atomic bootable OS Images.

## Code Template

This is generated from the Ublue Template:

https://github.com/ublue-os/image-template

# Atomized Plasma Desktops

## Plasma

Based on https://github.com/ublue-os/aurora

Image ghcr.io/ublue-os/aurora:latest

- KDE Plasma
- Homebrew
- ujust
- BTRFS
- Distrobox
- Boxbuddy

## Plasma for Gaming

Base https://github.com/ublue-os/bazzite

Image ghcr.io/ublue-os/bazzite-nvidia:latest

- KDE Plasma
- Nvidia Drivers
- Steam
- Lutris
- Bazaar
- Homebrew
- ujust
- BTRFS
- Distrobox
- Boxbuddy

# Atomized Hyprland Desktops

Base: https://github.com/wayblueorg

Image ghcr.io/wayblueorg/hyprland:latest

## Caelestia

Source: https://github.com/caelestia-dots/shell

- Hyprland
- Quickshell
- fish
- foot

## Hyprland with Hyprpanel

Source: https://github.com/Jas-SinghFSU/HyprPanel

- Hyprland
- Hyprpanel

## Omarchy (testing)

Source: https://github.com/basecamp/omarchy

- Hyprland
- Waybar

## ML4W (testing)

Source: https://github.com/mylinuxforwork/dotfiles

- Hyprland
- Waybar

## HyDE (testing)

Source: https://github.com/HyDE-Project/HyDE

- Hyprland
- Quickshell

## End-4 (testing)

Source: https://github.com/end-4/dots-hyprland

- Hyprland
- Quickshell

## Installation ISO Download

https://archive.org/details/@mrjncsk

## Rebase from other Atomic OS

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mrjncsk/atomized(-desktop)(-nvidia)
```

when Rebasing you have to copy default configurations from /etc/skel
- Backup existing Configs in ~/.config
- Copy needet Configs from /etc/skel/.config to ~/.config

mrjn

![Title](Data/atomized/usr/share/atomized/Title.png)
