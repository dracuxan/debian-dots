#!/bin/bash

set -e  # Exit immediately if a command fails

# Update system
echo "Updating system..."
sudo pacman -Syu --noconfirm

# Install dependencies
echo "Installing dependencies..."
sudo pacman -S --noconfirm curl git unzip tar base-devel

# Install nvm (for latest Node.js & npm)
echo "Installing nvm..."
sudo pacman -S --noconfirm npm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
source ~/.zshrc
nvm install node

echo "Node.js & npm installed:"
node -v
npm -v

# Install Go (latest version)
echo "Installing latest Go..."
curl -OL https://go.dev/dl/go$(curl -s https://go.dev/VERSION?m=text).linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go*.linux-amd64.tar.gz
rm go*.linux-amd64.tar.gz
echo 'export PATH="/usr/local/go/bin:$HOME/go/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
go version

echo "Go installed:"
go version

# Install asdf (for latest Elixir & Erlang)
echo "Installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.zshrc
source ~/.zshrc

# Install Elixir & Erlang
echo "Installing latest Elixir & Erlang..."
asdf plugin add erlang || true
asdf plugin add elixir || true
asdf install erlang latest
asdf install elixir latest
asdf global erlang latest
asdf global elixir latest
echo "Elixir installed:"
elixir -v

# Install Rust (via rustup)
echo "Installing Rust..."
sudo pacman -S --noconfirm rustup
rustup install stable
rustup default stable
echo "Rust installed:"
rustc --version
cargo --version

echo "✅ All latest versions installed successfully!"
