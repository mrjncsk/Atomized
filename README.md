![Logo](Logo.png)

Personalized Atomic OS Images for my Gaming Desktop (bazzite-nvidia) & Thinkpad (bazzite)

## Template

This is build of the Ublue Template:

https://github.com/ublue-os/image-template

## Based on Bazzite

https://github.com/ublue-os/bazzite

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

## Build ISO

```bash
sudo dnf install bootc-image-builder
bootc-image-builder iso ghcr.io/mrjncsk/atomized:latest -o atomized.iso
```

## Rebase from any Atomic System

Install any Fedora Atomic ISO

- https://fedoraproject.org/atomic-desktops/kinoite/download
- https://universal-blue.org/

Rebase:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mrjncsk/atomized
```

## Configuration

- New Users
  - Default Configs will be copied from /etc/skel
- Existing Users
  - manually copy Configs from /etc/skel

![Title](Title.png)
