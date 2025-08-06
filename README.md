![Logo](Data/atomized/usr/share/atomized/Logo.png)

# Atomizing Desktop Environments

Bring popular Desktop Environments to Fedora Atomic OS

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
- Kitty
- Nvim
- MC

Based on https://github.com/ublue-os/bazzite with

- Steam
- Lutris
- Bazaar

## Caelestia Hyprland

https://github.com/caelestia-dots/shell

## Hyprlanf with Hayrpanel

https://github.com/Jas-SinghFSU/HyprPanel

## Installation ISO Download

https://archive.org/details/@mrjncsk

## Rebase from other Atomic OS

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mrjncsk/atomized(-desktop)(-nvidia)
```

when rebasing existing Users may need Atomized spezific configs from /etc/skel

- mrjn

![Title](Data/atomized/usr/share/atomized/Title.png)
