#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[+] Installing stow if missing..."
sudo apt install -y stow

echo "[+] Creating .config if missing..."
mkdir -p "$HOME/.config"

echo "[+] Syncing .config files..."
rsync -av --progress "$DOTFILES_DIR/.config/" "$HOME/.config/"

echo "[+] Stowing legacy dotfiles..."
stow -d "$DOTFILES_DIR" -t "$HOME" tmux
stow -d "$DOTFILES_DIR" -t "$HOME" zsh

if ! grep -q 'LOGO_DIR' ~/.zshrc; then
    echo '[+] Adding LOGO_DIR to .zshrc'
    echo 'export LOGO_DIR="$HOME/.config/fastfetch/logos"' >> ~/.zshrc
fi

echo "[+] Done. Reloading zsh..."
exec zsh

