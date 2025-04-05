#!/bin/bash

set -e

echo "[*] Updating System..."
sudo apt update && sudo apt upgrade -y

echo "[*] Installing Base Tools..."
sudo apt install -y \
    curl wget git build-essential unzip tar \
    stow zsh tmux alacritty \
    xorg xserver-xorg xinit libx11-dev libxft-dev libxinerama-dev \
    picom rofi feh lxappearance thunar pulseaudio pavucontrol network-manager blueman

echo "[*] Programming Languages..."
sudo apt install -y gcc g++ python3 python3-pip lua5.4 make

echo "[*] Node.js setup..."
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs

echo "[*] Essentials installed!"
