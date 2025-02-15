#!/bin/bash

set -e  # Exit if any command fails

# Detect package manager
if command -v apt &> /dev/null; then
    PKG_MANAGER="apt"
elif command -v pacman &> /dev/null; then
    PKG_MANAGER="pacman"
else
    echo "Unsupported package manager. Please install manually."
    exit 1
fi

# Define required packages
PACKAGES=("stow" "neovim" "neofetch" "starship")

# Install missing packages
echo "Checking for required packages..."
for pkg in "${PACKAGES[@]}"; do
    if [ "$PKG_MANAGER" = "apt" ]; then
        sudo apt-get install -y "$pkg"
    elif [ "$PKG_MANAGER" = "pacman" ]; then
        sudo pacman -S --noconfirm "$pkg"
    fi
done

echo "Installation complete using $PKG_MANAGER!"

# Use Stow to symlink dotfiles
echo "Stowing dotfiles..."
stow -d ~/dotfiles -t ~ nvim
stow -d ~/dotfiles -t ~ neofetch
stow -d ~/dotfiles -t ~ starship

# Ensure Neofetch ASCII art is copied
if [ -d "$HOME/dotfiles/ascii" ]; then
    echo "Copying Neofetch ASCII art...[Copy pasted from somewhere]"
    sudo cp -r ~/dotfiles/ascii /usr/share/neofetch
fi

echo "Done. Enjoy."
