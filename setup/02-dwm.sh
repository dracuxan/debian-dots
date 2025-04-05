#!/bin/bash

set -e

echo "[*] Installing DWM & suckless tools..."

# Directory for all suckless builds
SUCKLESS_DIR="$HOME/suckless"

mkdir -p "$SUCKLESS_DIR"
cd "$SUCKLESS_DIR"

# Dependencies
echo "[*] Installing required packages..."
sudo apt install -y build-essential libx11-dev libxft-dev libxinerama-dev xorg xserver-xorg suckless-tools libxrandr-dev libx11-xcb-dev

# Clone and build dwm
echo "[*] Cloning dwm..."
git clone https://git.suckless.org/dwm
cd dwm
sudo make clean install
cd ..

# Clone and build st
echo "[*] Cloning st..."
git clone https://git.suckless.org/st
cd st
sudo make clean install
cd ..

# Clone and build dmenu
echo "[*] Cloning dmenu..."
git clone https://git.suckless.org/dmenu
cd dmenu
sudo make clean install
cd ..

# Optional: slstatus
echo "[*] Cloning slstatus..."
git clone https://git.suckless.org/slstatus
cd slstatus
sudo make clean install
cd ..

echo "[*] Suckless stack installed in $SUCKLESS_DIR"
