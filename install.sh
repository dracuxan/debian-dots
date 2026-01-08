#!/usr/bin/env bash

set -e # Exit on error

echo "-----------------------------------------------------"
echo "       dracuxan's Dotfiles for NixOS Installer       "
echo "-----------------------------------------------------"

echo "[+] Checking stow..."
if command -v stow >/dev/null 2>&1; then
    echo "[+] exists"
else
    echo "[-] stow does not exist! Please install manually"
    exit 1
fi

echo "[+] Stowing dotfiles..."

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[+] Preparing ~/.config layout..."
for dir in fastfetch nvim; do
    mkdir -p "$HOME/.config/$dir"
done

echo "[+] Stowing configs into ~/.config..."

stow --adopt -d "$DOTFILES_DIR" -t "$HOME/.config/" fastfetch
stow --adopt -d "$DOTFILES_DIR" -t "$HOME/.config/" nvim

echo "[+] Stowing legacy dotfiles into ~..."
stow --adopt -d "$DOTFILES_DIR" -t "$HOME" zsh
stow --adopt -d "$DOTFILES_DIR" -t "$HOME" tmux
stow --adopt -d "$DOTFILES_DIR" -t "$HOME/.local/bin" scripts

echo "-----------------------------------------"
echo "       Setup Complete — Reboot Now       "
echo "-----------------------------------------"
