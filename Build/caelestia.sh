#!/bin/bash
set -ouex pipefail

### Enable Copr
dnf5 -y copr enable solopasha/hyprland
dnf5 -y copr enable atim/starship
dnf5 -y copr enable errornointernet/quickshell

### Install Software
dnf5 -y install \
    hyprland \
    hypridle \
    hyprshot \
    hyprlock \
    hyprland-qtutils \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    thunar \
    matugen \
    swww \
    foot \
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
    aubio\
    aubio-devel \
    python3 \
    python3-pip \
    python3-build \
    python3-installer \
    python3-hatchling \
    python3-hatch-vcs

### Get Caelestia Files
cd /tmp
git clone --depth 1 https://github.com/caelestia-dots/caelestia.git
git clone --depth 1 https://github.com/caelestia-dots/shell.git
git clone --depth 1 https://github.com/caelestia-dots/cli.git
git clone --depth 1 https://github.com/Vladimir-csp/app2unit.git

### Copy Caelestia Files
mkdir -p /usr/lib/caelestia /etc/skel/.config/quickshell /etc/skel/.local/share
cp -Rf /tmp/caelestia /etc/skel/.local/share/caelestia
rm -Rf /etc/skel/.config/hypr
rm -Rf /etc/skel/.config/starship.toml
ln -s ../.local/share/caelestia/hypr      /etc/skel/.config/hypr
ln -s ../.local/share/caelestia/btop      /etc/skel/.config/btop
ln -s ../.local/share/caelestia/fastfetch /etc/skel/.config/fastfetvh
ln -s ../.local/share/caelestia/fish      /etc/skel/.config/fish
#ln -s ../.local/share/caelestia/foot      /etc/skel/.config/foot
ln -s ../.local/share/caelestia/uwsm      /etc/skel/.config/uwsm
ln -s ../.local/share/caelestia/starship.toml /etc/skel/.config/starship.toml
cp -Rf /tmp/shell /etc/skel/.config/quickshell/caelestia

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
    python3-pip \
    python3-build \
    python3-installer \
    python3-hatchling \
    python3-hatch-vcs \
    aubio-devel \
    pipewire-devel

### Disable Copr
dnf5 -y copr disable solopasha/hyprland
dnf5 -y copr disable atim/starship
dnf5 -y copr disable errornointernet/quickshell
