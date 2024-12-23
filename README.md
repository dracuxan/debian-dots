# Dotfiles
Dotfiles for my WSL setup.

## Tools and Dependencies:

- [Neovim (v0.8 or higher)](https://neovim.io/)
- [Zsh](https://www.zsh.org/)
- [neofetch](https://github.com/dylanaraps/neofetch)
- [Starship](https://starship.rs/)
- [Node.js](https://nodejs.org/)
- [Python](https://www.python.org/)
- [Go](https://go.dev/)
- [Elixir](https://elixir-lang.org/)

## Directory Structure

```
dotfiles/
├── install.sh
├── LICENSE
├── neofetch
│   └── .config
│       └── neofetch
│           └── ... (Neofetch Config)
├── nvim
│   └── .config
│       └── nvim
│           └── ... (Neovim Config files)
├── starship
│   └── .config
│       └── ... (Starship Config)
├── zsh
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

or

  ```
  stow -d ~/dotfiles -t ~ [any config eg. nvim]
  ```

Dependency for neofetch 

  ```
  sudo cp -r ascii /usr
  ```

## Preview
![Preview](https://github.com/user-attachments/assets/9d7a8281-d5b7-42e5-bd56-5a63797093cc)
