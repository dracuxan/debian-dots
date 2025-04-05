#!/bin/bash

set -e

echo "[*] Installing Fonts & Nerd Fonts..."
sudo apt install fonts-firacode fonts-jetbrains-mono fonts-noto-color-emoji

echo "[*] Setting zsh as default shell..."
chsh -s $(which zsh)

echo "[*] Final tweaks done!"
