# Dotfiles
This repository contains my personal dotfiles for configuring various tools and environments. This includes configurations for Neovim, Zsh, and potentially other applications.

## Directory Structure

```
dotfiles/
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
```
git clone git@github.com:Nisarg2061/Dot-Files.git ~/dotfiles
```

```
sudo apt-get install stow
```

```
cd ~/dotfiles
```

```
stow -d ~/dotfiles -t ~ nvim
```

```
stow -d ~/dotfiles -t ~ zsh
```
```
touch ~/.zsh_history // Only if the file does not exists
```

## Usage
- **Neovim**: Configuration files are located in ~/.config/nvim/. Adjust init.nvim and other files as needed.
- **Zsh**: Configuration files are located in ~/.zshrc and ~/.zsh_history. The .zsh/ directory contains Zsh plugins.


## Sneak Peek
![Sneak Peek](https://github.com/user-attachments/assets/70b7227c-b475-4ef6-a82a-9c19b6a0d00a)
