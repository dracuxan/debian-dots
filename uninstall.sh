#!/bin/bash

set -e

echo "[+] Checking stow..."
if ! command -v stow >/dev/null 2>&1; then
    echo "[-] stow is not installed. Cannot proceed."
    exit 1
fi

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[+] Unstowing configs from ~/.config/..."

config_packages=(
    "fastfetch:$HOME/.config/fastfetch"
    "nvim:$HOME/.config/nvim"
    "alacritty:$HOME/.config/alacritty"
    "i3:$HOME/.config/i3"
    "i3status:$HOME/.config/i3status"
    "picom:$HOME/.config/picom"
    "rofi:$HOME/.config/rofi"
    "dunst:$HOME/.config/dunst"
    "starship:$HOME/.config"
)

for item in "${config_packages[@]}"; do
    pkg="${item%%:*}"
    target="${item##*:}"
    stow -D -d "$DOTFILES_DIR" -t "$target" "$pkg" || true
done

echo "[+] Unstowing legacy dotfiles from ~/..."

home_packages=(
    "zsh:$HOME"
    "tmux:$HOME"
    "iex:$HOME"
    "scripts:$HOME/.local/bin"
)

for item in "${home_packages[@]}"; do
    pkg="${item%%:*}"
    target="${item##*:}"
    stow -D -d "$DOTFILES_DIR" -t "$target" "$pkg" || true
done

echo "[+] Cleanup complete."
