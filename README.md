![Logo](images/Logo.png)

My personalized Atomic OS Images for Desk/Laptop

## Base

- Template: https://github.com/ublue-os/image-template
- Base: https://github.com/ublue-os/bazzite

## Bazzite

- KDE Plasma
- Bazaar
- Boxbuddy
- Homebrew
- Waydroid
- ujust
- BTRFS
- Steam
- Lutris

## Additions

- Hyprland
- kitty
- nvim
- mc

## Personalisations

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
