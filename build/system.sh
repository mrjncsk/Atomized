#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable ublue-os/staging
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable atim/starship
dnf5 -y copr enable errornointernet/quickshell

### Install required Software
dnf5 -y install \
    kitty nvim mc \
    hyprland hyprland-qtutils hypridle hyprshot hyprlock hyprpanel \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    matugen \
    swww \
    wofi \
    fish \
    quickshell-git \
    wireplumber \
    wl-clipboard \
    btop \
    jq \
    socat \
    ImageMagick \
    bluez \
    inotify-tools \
    trash-cli \
    foot \
    starship \
    adw-gtk3-theme \
    qt5ct qt6ct \
    qt6-qtdeclarative \
    jetbrains-mono-fonts-all \
    ddcutil \
    brightnessctl \
    cava \
    NetworkManager \
    lm_sensors \
    aubio aubio-devel \
    glibc \
    materia-gtk-theme \
    grim \
    swappy \
    libqalculate \
    fuzzel \
    python3-build python3-installer \
    python3-hatchling python3-hatch-vcs \
    pipewire-libs pipewire-devel \
    libnotify

### Setup Caelestia
cd /tmp
git clone https://github.com/caelestia-dots/caelestia.git
git clone https://github.com/caelestia-dots/shell.git
git clone https://github.com/caelestia-dots/cli.git
cp -Rf caelestia/hypr /etc/skel/.config/
mkdir /etc/skel/.config/quickshell/
cp -Rf /tmp/shell /etc/skel/.config/quickshell/caelestia
cd /etc/skel/.config/quickshell
g++ -std=c++17 -Wall -Wextra -I/usr/include/pipewire-0.3 -I/usr/include/spa-0.2 -I/usr/include/aubio -o beat_detector caelestia/assets/beat_detector.cpp -lpipewire-0.3 -laubio
mkdir /usr/lib/caelestia/
mv beat_detector /usr/lib/caelestia/beat_detector
cd /tmp/cli
python -m build --wheel
mkdir -p /var/usrlocal/bin
python -m installer dist/*.whl
cp completions/caelestia.fish /usr/share/fish/vendor_completions.d/caelestia.fish

### Remove Build Software
# dnf5 -y remove glibc python3-build ...

### Disable Copr
dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable atim/starship
dnf5 -y copr disable errornointernet/quickshell

### Remove Steam Autostart
rm -f /etc/skel/.config/autostart/steam.desktop

### Remove Steam Wallpapers
rm -f /usr/share/wallpapers/*.*
rm -f /usr/share/hypr/wall2.png

### Remove Color Schemes
rm -f /usr/share/color-schemes/VGUI.colors
rm -f /usr/share/color-schemes/Vapor.colors

### Remove Themes
rm -Rf /usr/share/plasma/look-and-feel/com.valve.vapor.desktop
rm -Rf /usr/share/plasma/look-and-feel/com.valve.vgui.desktop
rm -Rf /usr/share/plasma/look-and-feel/org.fedoraproject.dedpra.desktop
rm -Rf /usr/share/sddm/themes/01-breeze-fedora
rm -Rf /usr/share/plymouth/themes/bgrt
rm -Rf /usr/share/plymouth/themes/charge
rm -Rf /usr/share/plymouth/themes/details
rm -Rf /usr/share/plymouth/themes/text
rm -Rf /usr/share/plymouth/themes/tribar

### OS Release
sed -i \
-e 's/^NAME=.*/NAME="Atomized"/' \
-e 's/^PRETTY_NAME=.*/PRETTY_NAME="Atomized (from Ublue)"/' \
-e 's/^LOGO=.*/LOGO=atomized-logo-icon/' \
-e 's/^DEFAULT_HOSTNAME=.*/DEFAULT_HOSTNAME="atomized"/' \
-e 's/^HOME_URL=.*/HOME_URL="https:\/\/github.com\/mrjncsk\/atomized"/' \
-e 's/^BOOTLOADER_NAME=.*/BOOTLOADER_NAME="atomized"/' \
/usr/lib/os-release

### Rebuild Initramfs
QUALIFIED_KERNEL="$(dnf5 repoquery --installed --queryformat='%{evr}.%{arch}' kernel)"
/usr/bin/dracut --no-hostonly --kver "$QUALIFIED_KERNEL" --reproducible --zstd -v --add ostree -f "/usr/lib/modules/$QUALIFIED_KERNEL/initramfs.img"
chmod 0600 "/usr/lib/modules/$QUALIFIED_KERNEL/initramfs.img"
