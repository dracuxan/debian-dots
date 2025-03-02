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
sudo pacman -Syu --noconfirm

#!/bin/bash

# Install dependencies if not already installed
echo "Checking and installing dependencies..."
deps=("curl" "git" "unzip" "tar" "base-devel" "nvim" "fastfetch")

for dep in "${deps[@]}"; do
    if ! pacman -Qi $dep &>/dev/null; then
        echo "Installing $dep..."
        sudo pacman -S --noconfirm $dep
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
    # Install npm (which includes Node.js)
    echo "Installing npm (which installs Node.js)..."
    sudo pacman -S --noconfirm npm
    npm install node

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
    # Install Rust via rustup
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    # Load Rust environment (without needing to restart shell)
    source "$HOME/.cargo/env"

    # Install & set stable version as default
    rustup install stable
    rustup default stable

    # Verify installation
    echo "Rust installed successfully!"
    rustc --version
    cargo --version
fi
echo "All languages installed successfully!"

if ! command -v starship >/dev/null; then
    echo "Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh
    echo "Starship installed successfully."
    echo "eval "$(starship init zsh)"" >>~/.zshrc
    starship -V
else
    echo "Starship is already installed"
    starship -V
fi
