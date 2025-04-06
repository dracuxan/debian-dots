#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[+] Preparing ~/.config layout..."
for dir in nvim fastfetch alacritty; do
    mkdir -p "$HOME/.config/$dir"
done

echo "[+] Stowing configs into ~/.config..."
stow -d "$DOTFILES_DIR" -t "$HOME/.config/nvim" nvim
stow -d "$DOTFILES_DIR" -t "$HOME/.config/alacritty" alacritty
stow -d "$DOTFILES_DIR" -t "$HOME/.config/fastfetch" fastfetch
stow -d "$DOTFILES_DIR" -t "$HOME/.config" starship

echo "[+] Stowing legacy dotfiles into ~..."
stow -d "$DOTFILES_DIR" -t "$HOME" tmux
stow -d "$DOTFILES_DIR" -t "$HOME" zsh

echo "[+] Done. Launching zsh..."
exec zsh
