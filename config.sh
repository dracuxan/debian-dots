#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[+] Installing stow if missing..."
sudo apt install -y stow

echo "[+] Creating .config if missing..."
mkdir -p "$HOME/.config"

# Ensure ~/.config exists
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/fastfetch"
mkdir -p "$HOME/.config/alacritty"


# Use Stow to symlink dotfiles to ~/.config
echo "[+] Syncing .config files..."
stow -d "$DOTFILES_DIR" -t "$HOME/.config/nvim" nvim
stow -d "$DOTFILES_DIR" -t "$HOME/.config/alacritty" alacritty
stow -d "$DOTFILES_DIR" -t "$HOME/.config/fastfetch" fastfetch
stow -d "$DOTFILES_DIR" -t "$HOME/.config" starship

echo "[+] Stowing legacy dotfiles..."
stow -d "$DOTFILES_DIR" -t "$HOME" tmux
stow -d "$DOTFILES_DIR" -t "$HOME" zsh

if ! grep -q 'LOGO_DIR' ~/.zshrc; then
    echo '[+] Adding LOGO_DIR to .zshrc'
    echo 'export LOGO_DIR="$HOME/.config/fastfetch/logos"' >>~/.zshrc
fi

echo "[+] Done. Reloading zsh..."
exec zsh
