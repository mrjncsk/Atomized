![Logo](images/Logo.png)

Personalized Atomic OS Images for my Gaming Desktop (bazzite-nvidia) & Thinkpad (aurora)

## Template

This is build of the Ublue Template:

- Template: https://github.com/ublue-os/image-template

## Gaming Image (atomized-game)

Based of https://github.com/ublue-os/bazzite-nivida

- KDE Plasma
- Bazaar
- Homebrew
- ujust
- BTRFS
- Steam
- Lutris
- Waydroid
- Distrobox
- Boxbuddy

## Laptop Image (atomized)

Based of https://github.com/ublue-os/aurora

- KDE Plasma
- Bazaar
- Homebrew
- ujust
- BTRFS
- Waydroid
- Distrobox
- Boxbuddy

## Atoimzed Additions

Software

- Hyprland
- kitty
- nvim
- mc

Personalisations

- Logos
- Themes
- Wallpapers

## Build ISO

```bash
sudo dnf install bootc-image-builder
bootc-image-builder iso ghcr.io/mrjncsk/atomized:latest -o atomized.iso
```

## Rebase from other Atomic System

Install any Fedora Atomic ISO

- https://fedoraproject.org/atomic-desktops/kinoite/download
- https://universal-blue.org/

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mrjncsk/atomized
```

![Title](images/Title.png)
