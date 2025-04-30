#!/bin/bash

set -e # Exit on error

echo "-----------------------------------------"
echo "       dracuxan's Dotfiles Installer     "
echo "-----------------------------------------"

echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[+] Installing stow..."
sudo apt install -y stow

echo "[+] Stowing dotfiles..."
chmod +x config.sh
./config.sh

echo "-----------------------------------------"
echo "       Setup Complete — Reboot Now       "
echo "-----------------------------------------"
