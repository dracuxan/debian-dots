#!/bin/bash

set -e # Exit if any command fails

# Get the directory of the script
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure ~/.config exists
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/fastfetch"

# Use Stow to symlink dotfiles to ~/.config
echo "Stowing dotfiles..."
stow -d "$DOTFILES_DIR" -t "$HOME/.config/nvim" nvim
stow -d "$DOTFILES_DIR" -t "$HOME/.config/fastfetch" fastfetch
echo "export LOGO_DIR="$HOME/.config/fastfetch/logos"" >>~/.zshrc
stow -d "$DOTFILES_DIR" -t "$HOME/.config" starship
stow -d "$DOTFILES_DIR" -t "$HOME" tmux

echo "Done. Enjoy."
