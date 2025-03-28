#!/bin/bash

echo "
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
                                                             "

set -e # Exit immediately if a command fails

# Update system
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Install dependencies if not already installed
echo "Checking and installing dependencies..."
deps=("curl" "git" "unzip" "tar" "build-essential" "neovim" "fastfetch")

for dep in "${deps[@]}"; do
    if ! dpkg -s $dep &>/dev/null; then
        echo "Installing $dep..."
        sudo apt install -y $dep
    else
        echo "$dep is already installed."
    fi
done

# Check if Node.js and npm are installed
if command -v node &>/dev/null && command -v npm &>/dev/null; then
    echo "Node.js & npm are already installed:"
    node -v
    npm -v
else
    echo "Installing Node.js and npm..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt install -y nodejs

    # Verify installation
    echo "Node.js & npm installed successfully!"
    node -v
    npm -v
fi

# Check if Go is already installed
if command -v go &>/dev/null; then
    echo "Go is already installed: $(go version)"
else
    echo "Installing latest Go..."
    wget https://go.dev/dl/go1.24.0.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf go1.24.0.linux-amd64.tar.gz
    rm go*.linux-amd64.tar.gz

    # Add Go to PATH if not already present
    if ! grep -q '/usr/local/go/bin' ~/.zshrc; then
        echo 'export PATH="/usr/local/go/bin:$HOME/go/bin:$PATH"' >>~/.zshrc
        echo "Added Go to PATH in ~/.zshrc"
    fi

    source ~/.zshrc
    echo "Go installed successfully!"
fi

# Verify Go installation
go version

# Check if Rust is installed
if command -v rustc &>/dev/null && command -v cargo &>/dev/null; then
    echo "Rust is already installed:"
    rustc --version
    cargo --version
else
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    # Load Rust environment (without needing to restart shell)
    source "$HOME/.cargo/env"

    rustup install stable
    rustup default stable

    # Verify installation
    echo "Rust installed successfully!"
    rustc --version
    cargo --version
fi

# Check if Clang is installed
if command -v clang &>/dev/null; then
    echo "Clang is already installed:"
    clang --version
else
    echo "Installing Clang..."
    sudo apt install -y clang

    # Verify installation
    echo "Clang installed successfully!"
    clang --version
fi

echo "All languages installed successfully!"

# Check if Starship is installed
if ! command -v starship &>/dev/null; then
    echo "Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh
    echo "Starship installed successfully."
    echo 'eval "$(starship init zsh)"' >>~/.zshrc
    starship -V
else
    echo "Starship is already installed"
    starship -V
fi

echo "All dependencies installed successfully."
echo ""
echo "Run ./config.sh to complete setup."
