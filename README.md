![Logo](Data/atomized/usr/share/atomized/Logo.png)

# Atomized Desktop Environments

Atomizing some Desktop Environments with Fedora Atomic bootable OS Images

## Code Template

This is build of the Ublue Template:

https://github.com/ublue-os/image-template

## Atomized Plasma

Based on https://github.com/ublue-os/aurora

- KDE Plasma
- Homebrew
- ujust
- BTRFS
- Distrobox
- Boxbuddy

## Plasma Nvidia

Based on https://github.com/ublue-os/bazzite

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

## Caelestia Hyprland

Base: https://github.com/ublue-os/main

Code: https://github.com/caelestia-dots/shell

- Hyprland
- Quickshell
- fish
- food

## Hyprland with Hyprpanel

Base: https://github.com/ublue-os/main

Code: https://github.com/Jas-SinghFSU/HyprPanel

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
