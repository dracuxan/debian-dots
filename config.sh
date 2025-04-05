#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo apt install -y stow

mkdir -p "$HOME/.config"

echo "Stowing dotfiles..."

stow -d "$DOTFILES_DIR" -t "$HOME/.config" nvim
stow -d "$DOTFILES_DIR" -t "$HOME/.config" fastfetch
stow -d "$DOTFILES_DIR" -t "$HOME/.config" starship
stow -d "$DOTFILES_DIR" -t "$HOME/.config" alacritty
stow -d "$DOTFILES_DIR" -t "$HOME" tmux

if ! grep -q 'LOGO_DIR' ~/.zshrc; then
    echo 'export LOGO_DIR="$HOME/.config/fastfetch/logos"' >>~/.zshrc
fi

echo "Done. Reloading zsh..."
exec zsh
