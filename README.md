[![wakatime](https://wakatime.com/badge/user/0d75cfc5-da70-41b7-b8c8-661ef9d8338b/project/9358976a-67c2-4357-8140-bd4a4c743b96.svg)](https://wakatime.com/badge/user/0d75cfc5-da70-41b7-b8c8-661ef9d8338b/project/9358976a-67c2-4357-8140-bd4a4c743b96)

# [#] Dotfiles

Personal dotfiles setup for managing Neovim, Fastfetch, Starship, zsh, tmux and more — using `stow` for clean symlinks and `make` for convenience.

## [+] Pre-requisites

Make sure your system has:

- git
- stow
- zsh

Optional but recommended (auto-installed if missing via install.sh):

- Neovim (v0.8 or higher)
- Fastfetch
- Starship

Additional tools for LSP / Development:

- Go
- Clang
- Python
- Node.js

## Directory Structure

```
dotfiles/
│
├── alacritty/          → Alacritty config
├── fastfetch/          → Fastfetch config
├── nvim/               → Neovim config
├── starship/           → Starship prompt config
├── tmux/               → tmux config
├── zsh/                → zsh config
│
├── setup/              → setup scripts
├── config.sh           → config linking using stow
├── install.sh          → dependency installer
│
├── Makefile            → task runner
└── README.md
```

## [>>] Installation

> [!WARNING]\
> Under _**active development**_ — Existing config files will be overwritten!

```
git clone https://github.com/dracuxan/Dot-Files.git ~/dotfiles && cd ~/dotfiles
```

### [::] Make Commands to Complete the installation

| Command      | Description                                  |
| ------------ | -------------------------------------------- |
| make install | Runs install.sh — Installs dependencies      |
| make config  | Runs config.sh — Symlinks configs using stow |
| make dwm     | Runs DWM setup script (if you use DWM)       |
| make all     | Runs install, config & dwm (in that order)   |
| make clean   | Unstows (removes) all symlinked configs      |

## Screenshots

![Fastfetch](https://github.com/user-attachments/assets/31804d54-ff43-45c6-8f1b-79e3ae28cd0d)
![Neovim](https://github.com/user-attachments/assets/cb92ce16-dd48-48de-aea7-0d83d5bd2709)
![Neovim](https://github.com/user-attachments/assets/ab2f30a2-6305-4d98-af52-cd81d4dc5b1f)
![toggleterm](https://github.com/user-attachments/assets/e465ac94-6129-469a-94f4-8658a2dbc416)
![tmux](https://github.com/user-attachments/assets/e72e1d81-1c6a-4da1-b68c-6859778b783d)
