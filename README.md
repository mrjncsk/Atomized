![Title](images/Title.png)

My personalized Atomic OS Images for Desk/Laptop

## Base

- Template: https://github.com/ublue-os/image-template
- Base: https://github.com/ublue-os/bazzite

## Bazzite

- KDE Plasma
- BTRFS
- Bazzar
- Steam
- Lutris
- Boxbuddy
- Waydroid

## Additions

- Hyprland
- kitty
- nvim
- mc

## Personalisations

- Logos
- Wallpapers

![Logo](images/Logo.png)![Logo](images/Logo.png)![Logo](images/Logo.png)![Logo](images/Logo.png)![Logo](images/Logo.png)![Logo](images/Logo.png)

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
