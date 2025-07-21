early test Version!

![Banner](images/Banner.png)

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

### Personalisations

- Logos
- Wallpapers

![Logo](images/Logo.png)

### Installation

Any Fedora Atomic

- https://fedoraproject.org/atomic-desktops/
- https://universal-blue.org/

Rebase with:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mrjncsk/atomized
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mrjncsk/atomized-nvidia
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mrjncsk/atomized-nvidia-open
```
