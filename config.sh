#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[+] Preparing ~/.config layout..."
for dir in nvim fastfetch alacritty .doom.d; do
    mkdir -p "$HOME/.config/$dir"
done

echo "[+] Stowing configs into ~/.config..."
stow --adopt -d "$DOTFILES_DIR" -t "$HOME/.config/nvim" nvim
stow --adopt -d "$DOTFILES_DIR" -t "$HOME/.config/alacritty" alacritty
stow --adopt -d "$DOTFILES_DIR" -t "$HOME/.config/fastfetch" fastfetch
stow --adopt -d "$DOTFILES_DIR" -t "$HOME/.doom.d" emacs

echo "[+] Stowing legacy dotfiles into ~..."
stow --adopt -d "$DOTFILES_DIR" -t "$HOME" tmux
stow --adopt -d "$DOTFILES_DIR" -t "$HOME" zsh

echo "[+] Done. Launching zsh..."
exec zsh
