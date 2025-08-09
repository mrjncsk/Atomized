![Logo](Data/atomized/usr/share/atomized/Logo.png)

# Atomized Desktop Environments

Atomizing some Desktop Environments with [Fedora Atomic](https://fedoraproject.org/atomic-desktops) bootable OS Images.


## Code Template

This is generated from the Ublue Template:

https://github.com/ublue-os/image-template


# Atomized Plasma Desktops

## Plasma

Base: https://github.com/ublue-os/aurora

Image: ghcr.io/ublue-os/aurora:latest

- KDE Plasma
- Homebrew
- ujust
- BTRFS
- Distrobox
- Boxbuddy


## Plasma for Gaming

Base: https://github.com/ublue-os/bazzite

Image: ghcr.io/ublue-os/bazzite-nvidia:latest

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

Image: ghcr.io/wayblueorg/hyprland:latest


## Caelestia (beta)

Source: https://github.com/caelestia-dots/shell

- Hyprland
- Quickshell
- fish
- foot


## Hyprland with HyprPanel (beta)

Source: https://github.com/Jas-SinghFSU/HyprPanel

- Hyprland
- Hyprpanel

![HyprPanel](https://github.com/Jas-SinghFSU/HyprPanel/raw/master/assets/hp1.png)


## ML4W (beta)

Source: https://github.com/mylinuxforwork/dotfiles

- Hyprland
- Waybar

![ML4W] (https://camo.githubusercontent.com/eace10017b56a4f53b23c752abcb815d1fb1993f11203a40bbfdb00a4e313d1d/68747470733a2f2f6d796c696e7578666f72776f726b2e6769746875622e696f2f646f7466696c65732f6d6c34772d707265766965772d3239392e6a7067)


## Omarchy (alpha)

Source: https://github.com/basecamp/omarchy

- Hyprland
- Waybar

![Omarchy] (https://camo.githubusercontent.com/eace10017b56a4f53b23c752abcb815d1fb1993f11203a40bbfdb00a4e313d1d/68747470733a2f2f6d796c696e7578666f72776f726b2e6769746875622e696f2f646f7466696c65732f6d6c34772d707265766965772d3239392e6a7067)


## HyDE (alpha)

Source: https://github.com/HyDE-Project/HyDE

- Hyprland
- Waybar

![HyDE] (https://private-user-images.githubusercontent.com/106020512/324331744-7f8fadc8-e293-4482-a851-e9c6464f5265.mp4?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTQ3NzUyNzMsIm5iZiI6MTc1NDc3NDk3MywicGF0aCI6Ii8xMDYwMjA1MTIvMzI0MzMxNzQ0LTdmOGZhZGM4LWUyOTMtNDQ4Mi1hODUxLWU5YzY0NjRmNTI2NS5tcDQ_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUwODA5JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MDgwOVQyMTI5MzNaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT05YmNhNTMwOTEwNThmYmQyZGIyYzcxOTY1NjJiNWM5M2I0MWVmYWQ3MzI4NmE1Y2FlNDE4NjBkZTExNjcxYzIyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.R6Tvv0cMCg866NhxkwWKBRQvTiAU8UfivPtISSWM5N8)


## End-4 (alpha)

Source: https://github.com/end-4/dots-hyprland

- Hyprland
- Quickshell

![end-4] (https://private-user-images.githubusercontent.com/97237370/453181736-86cc511b-0d33-4c78-bcc0-3037d02a17da.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTQ3NzUzMjMsIm5iZiI6MTc1NDc3NTAyMywicGF0aCI6Ii85NzIzNzM3MC80NTMxODE3MzYtODZjYzUxMWItMGQzMy00Yzc4LWJjYzAtMzAzN2QwMmExN2RhLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA4MDklMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwODA5VDIxMzAyM1omWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWUzNzQ2MDRiOTgyOGNlMTliYjgwNmQ2MzcwYmIzNmU5MWIzYWVkNDc2OTk1NmRkNWIwYTQ2YmZmMTM0YjI2Y2MmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.IyqinY4sjX9NP29VOIH1oaodhTIbZTLqoh6xz__POBc)


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
