# Dotfiles
Dotfiles for my WSL setup.

## Tools and Dependencies:

- [Neovim (v0.8 or higher)](https://neovim.io/)
- [Zsh](https://www.zsh.org/) 
- [Starship](https://starship.rs/)
- [Node.js](https://nodejs.org/)
- [Python](https://www.python.org/)
- [Go](https://go.dev/)
- [Elixir](https://elixir-lang.org/)

## Directory Structure

```
dotfiles/
├── nvim
│   └── .config
│       └── nvim
│           └── ... (Neovim Config files)
├── starship
│   └── .config
│       └── starship.toml
└── zsh
│   └── .zshrc
└── README.md
```

## Installation
To set up these dotfiles on a new machine, follow these steps:

Clone The Repo and move to dotfiles directory:
```
git clone https://github.com/Nisarg2061/Dot-Files.git ~/dotfiles && cd ~/dotfiles
```

## Install Stow:

  ```
  sudo apt-get install stow
  ```

## Run this script to configure all the files(under construction):

  ```
  ./install.sh
  ```

## Sneak Peek
![Sneak Peek](https://github.com/user-attachments/assets/f475c089-86a0-4b1e-b662-7928597d476d)
