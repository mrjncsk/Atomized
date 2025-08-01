#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable atim/starship
dnf5 -y copr enable errornointernet/quickshell

### Install required Software
dnf5 -y install \
    kitty nvim mc \
    hyprland hypridle hyprshot hyprlock \
    hyprland-qtutils hyprpanel \
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
    glibc \
    grim \
    swappy \
    libqalculate \
    fuzzel \
    libnotify \
    aubio aubio-devel \
    python3-build python3-installer \
    python3-hatchling python3-hatch-vcs

### Get Caelestia Files
cd /tmp
git clone --depth 1 https://github.com/caelestia-dots/caelestia.git
git clone --depth 1 https://github.com/caelestia-dots/shell.git
git clone --depth 1 https://github.com/caelestia-dots/cli.git
git clone --depth 1 https://github.com/Vladimir-csp/app2unit.git
wget --no-hsts https://github.com/marella/material-symbols/raw/refs/heads/main/material-symbols/material-symbols-rounded.woff2
wget --no-hsts https://github.com/marella/material-symbols/raw/refs/heads/main/material-symbols/material-symbols-outlined.woff2
wget --no-hsts https://github.com/marella/material-symbols/raw/refs/heads/main/material-symbols/material-symbols-sharp.woff2

### Copy Caelestia Files
mkdir /usr/lib/caelestia/ /usr/share/fonts/material-symbols /etc/skel/.config/quickshell/
cp -Rf /tmp/caelestia /etc/skel/.local/share/
ln -s ../.local/share/caelestia/hypr /etc/skel/.config/hypr
cp -Rf /tmp/shell /etc/skel/.config/quickshell/caelestia
cp -Rf /tmp/material-symbols-*.woff2 /usr/share/fonts/material-symbols

### Install app2unit
install -Dm755 app2unit/app2unit /usr/bin/app2unit

### Build Caelestia Beat Detector
if pkg-config --exists pipewire-0.3 aubio; then
  echo "Building beat detector"
  g++ -std=c++17 -Wall -Wextra \
    -I/usr/include/pipewire-0.3 \
    -I/usr/include/spa-0.2 \
    -I/usr/include/aubio \
    -lpipewire-0.3 -laubio \
    -o /usr/lib/caelestia/beat_detector \
    shell/assets/beat_detector.cpp
else
  echo "Skipping beat detector – dependencies not found"
fi

### Build Caelestia CLI & Fish Completion
cd /tmp/cli
python -m build --wheel
pip install --prefix=/usr --root-user-action=ignore dist/*.whl
cp completions/caelestia.fish /usr/share/fish/vendor_completions.d/caelestia.fish

### Remove Build Software
dnf5 -y remove \
    python3-build python3-installer \
    python3-hatchling python3-hatch-vcs \
    aubio-devel \
    pipewire-devel

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable atim/starship
dnf5 -y copr disable errornointernet/quickshell

### Remove Steam Autostart
rm -f /etc/skel/.config/autostart/steam.desktop

### Remove Wallpapers
rm -f /usr/share/wallpapers/*.*
rm -f /usr/share/hypr/wall2.png

### Remove Color Schemes
rm -f /usr/share/color-schemes/VGUI.colors
rm -f /usr/share/color-schemes/Vapor.colors

### Remove default Wayland Session
rm -f /usr/share/wayland-sessions/hyprland.desktop

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

### Hyprland Configs
sed -i \
  -e '/exec-once.*polkit/ s|=.*|= /usr/libexec/kf6/polkit-kde-authentication-agent-1|' \
  -e '/exec-once.*keyring/ s|=.*|= /usr/bin/kwalletd6|' \
/etc/skel/.config/hypr/hyprland/execs.conf

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
