![Logo](files/usr/share/atomized/Logo.png)

Personalized Atomic OS Images for my Gaming Desktop (bazzite-nvidia) & Thinkpad (aurora)

## Code Template

This is build of the Ublue Template:

https://github.com/ublue-os/image-template

## Laptop Image based on Aurora

https://github.com/ublue-os/aurora

- KDE Plasma
- Homebrew
- ujust
- BTRFS
- Distrobox
- Boxbuddy

## Gaming Image based on Bazzite wirh Nvidia Drivers

https://github.com/ublue-os/bazzite

- KDE Plasma
- Bazaar
- Homebrew
- ujust
- BTRFS
- Distrobox
- Boxbuddy
- Steam
- Lutris

## Atomized Additions

Software

- Hyprland with Caelesia Shell
- Hyprland with Hyprpanel
- kitty
- nvim
- mc

Personalisations

- Logos
- Themes
- Wallpapers

## Installation ISO Download

https://archive.org/details/@mrjncsk

## Rebase from other Atomic OS

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mrjncsk/atomized(-nvidia)
```

Note that when rebasing existing Users may need Atomized spezific configs from /etc/skel

- mrjn

![Title](files/usr/share/atomized/Title.png)
