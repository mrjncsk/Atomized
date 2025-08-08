![Logo](Data/atomized/usr/share/atomized/Logo.png)

# Atomized Desktop Environments

Atomizing some Desktop Environments with Fedora Atomic bootable OS Images

## Code Template

This is generated from the Ublue Template:

https://github.com/ublue-os/image-template

# Atomized Desktops

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

# Hyprland Desktops

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

## Installation ISO Download

https://archive.org/details/@mrjncsk

## Rebase from other Atomic OS

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mrjncsk/atomized(-desktop)(-nvidia)
```

when rebasing existing Users may need Atomized spezific configs from /etc/skel

- mrjn

![Title](Data/atomized/usr/share/atomized/Title.png)
