#!/bin/bash
echo "
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
                                                             "

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
PACKAGES=("stow" "neovim" "fastfetch")

# Install missing packages
echo "Checking for required packages..."
for pkg in "${PACKAGES[@]}"; do
    if [ "$PKG_MANAGER" = "apt" ]; then
        sudo apt install -y "$pkg"
    elif [ "$PKG_MANAGER" = "pacman" ]; then
        sudo pacman -S --noconfirm "$pkg"
    fi
done

echo "Installation complete using $PKG_MANAGER!"

# Get the directory of the script
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ensure ~/.config exists
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/fastfetch"

# Use Stow to symlink dotfiles to ~/.config
echo "Stowing dotfiles..."
stow -d "$DOTFILES_DIR" -t "$HOME/.config/nvim" nvim
stow -d "$DOTFILES_DIR" -t "$HOME/.config" starship
stow -d "$DOTFILES_DIR" -t "$HOME/.config/fastfetch" fastfetch

echo "Done. Enjoy."
