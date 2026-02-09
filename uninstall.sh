#!/bin/bash

set -e

echo "[+] Checking stow..."
if ! command -v stow >/dev/null 2>&1; then
    echo "[-] stow is not installed. Cannot proceed."
    exit 1
fi

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[+] Unstowing configs from ~/.config/..."

stow -D -d "$DOTFILES_DIR" -t "$HOME/.config/fastfetch" fastfetch || true
stow -D -d "$DOTFILES_DIR" -t "$HOME/.config/nvim" nvim || true
stow -D -d "$DOTFILES_DIR" -t "$HOME/.config/alacritty" alacritty || true
stow -D -d "$DOTFILES_DIR" -t "$HOME/.config/kitty" kitty || true
stow -D -d "$DOTFILES_DIR" -t "$HOME/.config/i3" i3 || true
stow -D -d "$DOTFILES_DIR" -t "$HOME/.config/i3status" i3status || true
stow -D -d "$DOTFILES_DIR" -t "$HOME/.config/picom" picom || true
stow -D -d "$DOTFILES_DIR" -t "$HOME/.config/rofi" rofi || true
stow -D -d "$DOTFILES_DIR" -t "$HOME/.config/dunst" dunst || true
stow -D -d "$DOTFILES_DIR" -t "$HOME/.config" starship || true

echo "[+] Unstowing legacy dotfiles from ~/..."

stow -D -d "$DOTFILES_DIR" -t "$HOME" zsh || true
stow -D -d "$DOTFILES_DIR" -t "$HOME" tmux || true
stow -D -d "$DOTFILES_DIR" -t "$HOME" iex || true
stow -D -d "$DOTFILES_DIR" -t "$HOME/.local/bin" scripts || true

echo "[+] Cleanup complete."
