# Dotfiles
This repository contains my personal dotfiles for configuring various tools and environments. This includes configurations for Neovim, Zsh, and potentially other applications.

** **Caution: Currently the ZSH config is not working properly for OS other than Kali so use only if you can debug that!**

## Tools and Dependencies:

- [Neovim (v0.8 or higher)](https://neovim.io/)
- [Zsh](https://www.zsh.org/) **
- [neofetch](https://github.com/dylanaraps/neofetch?tab=readme-ov-file)
- [Node.js](https://nodejs.org/)
- [Python](https://www.python.org/)
- [Go](https://go.dev/)
- [Elixir](https://elixir-lang.org/)

## Directory Structure

```
dotfiles/
├── neofetch/
│   └── .config/
│       └── neofetch/ 
│           └── config.conf (Neofetch configuration files)
├── nvim/
│   └── .config/
│       └── nvim/ 
│           └── ... (Neovim configuration files)
├── zsh/
│   ├── .zsh/
│   │   └── zsh-autosuggestions/ (zsh plugin)
│   ├── .zsh_history
│   └── .zshrc
└── README.md
```

## Installation
To set up these dotfiles on a new machine, follow these steps:

Clone The Repo and move to dotfiles directory:
```
git clone https://github.com/Nisarg2061/Dot-Files.git ~/dotfiles && cd ~/dotfiles
```

### Install Stow:

- Ubuntu/Debian:
  ```
  sudo apt-get install stow
  ```

- Fedora:
  ```
  sudo dnf install stow
  ```

- Arch Linux:
  ```
  sudo pacman -S stow
  ```

- macOS:
  ```
  brew install stow
  ```

### For NeoVim:

  ```
  stow -d ~/dotfiles -t ~ nvim
  ```

### For Zsh:
  ```
  stow -d ~/dotfiles -t ~ zsh
  ```
  
  ```
  touch ~/.zsh_history # Only if the file does not exists
  ```
  
  ```
  source ~/.zshrc
  ```

### For Neofetch:
  ```
  stow -d ~/dotfiles -t ~ neofetch
  ```
Note: Not my own configurations for neofetch - [Actual Configs](https://github.com/neuromask/catppuccin-linux-theme)

## Usage
- **Neovim**: Configuration files are located in ~/.config/nvim/. Adjust init.nvim and other files as needed.
- **Zsh**: Configuration files are located in ~/.zshrc and ~/.zsh_history. The .zsh/ directory contains Zsh plugins.


## Sneak Peek
![Sneak Peek](https://github.com/user-attachments/assets/f475c089-86a0-4b1e-b662-7928597d476d)
