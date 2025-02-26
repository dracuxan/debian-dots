[![wakatime](https://wakatime.com/badge/github/dracuxan/Dot-Files.svg)](https://wakatime.com/badge/github/dracuxan/Dot-Files)

██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
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
├── fastfetch
│   ├── config.jsonc .......... (fastfetch Config)
│   └── logos ................. (logos)
│       ├── custom.txt
│       ├── kali.txt
│       └── legend.txt
├── nvim
│   └── lua
│       ├── core .............. (Core NVChad Config)
│       ├── custom
│       │   └── configs ....... (Custom Config)
│       └── plugins
│           └── configs ....... (Plugin Config)
├── install.sh ................ (Installation Config)
├── LICENSE
├── README.md ................. (Docs)
└── starship
    └── starship.toml ......... (Starship Config)
```

## Installation
To set up these dotfiles on a new machine, follow these steps:

Clone The Repo and move to dotfiles directory:

```
git clone https://github.com/Nisarg2061/Dot-Files.git ~/dotfiles && cd ~/dotfiles
```

## Run this script to configure all the files(compatable package managers: apt and pacman):

  ```
  ./install.sh
  ```
## Preview
![Preview](https://github.com/user-attachments/assets/9d7a8281-d5b7-42e5-bd56-5a63797093cc)
