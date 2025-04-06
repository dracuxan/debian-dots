#!/bin/bash

set -e # Exit on error

echo "-----------------------------------------"
echo "       dracuxan's Dotfiles Installer     "
echo "-----------------------------------------"

echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[+] Installing essentials..."
sudo apt install -y curl git unzip tar stow

echo "[+] Running setup scripts..."

chmod +x setup/*.sh

./setup/00-essentials.sh
# ./setup/02-dwm.sh
./setup/99-final-touches.sh

echo "[+] Stowing dotfiles..."
chmod +x config.sh
./config.sh

echo "-----------------------------------------"
echo "       Setup Complete — Reboot Now       "
echo "-----------------------------------------"
