#!/bin/bash
set -ouex pipefail

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
cp -Rf /tmp/material* /usr/share/fonts/material-symbols

### Install app2unit
install -Dm755 app2unit/app2unit /usr/bin/app2unit

### Build Caelestia Beat Detector
g++ -std=c++17 -Wall -Wextra \
    -I/usr/include/pipewire-0.3 \
    -I/usr/include/spa-0.2 \
    -I/usr/include/aubio \
    -lpipewire-0.3 -laubio \
    -o /usr/lib/caelestia/beat_detector \
    shell/assets/beat_detector.cpp

### Build Caelestia CLI & Fish Completion
cd /tmp/cli
python -m build --wheel
pip install --prefix=/usr --root-user-action=ignore dist/*.whl
cp completions/caelestia.fish /usr/share/fish/vendor_completions.d/caelestia.fish
