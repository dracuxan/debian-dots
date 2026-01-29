[![wakatime](https://wakatime.com/badge/user/0d75cfc5-da70-41b7-b8c8-661ef9d8338b/project/9358976a-67c2-4357-8140-bd4a4c743b96.svg)](https://wakatime.com/badge/user/0d75cfc5-da70-41b7-b8c8-661ef9d8338b/project/9358976a-67c2-4357-8140-bd4a4c743b96)

# Dotfiles

Personal configuration for Neovim, i3, tmux, zsh, and other tools, managed with GNU stow.

![preview](./screenshots/new_rice.png)

## Installation

> [!WARNING]
> These dotfiles are under **active development**. Existing configurations will be overwritten.

### 1. Clone & Dependencies

Install packages using Nix (recommended) or your system package manager.
**Requirements:** `stow`, `git`, `zsh`, `Neovim`, `tmux`, `i3`, `picom`.

```bash
git clone https://github.com/dracuxan/debian-dots.git ~/dotfiles && cd ~/dotfiles
# Optional: Install tools via Nix
nix profile install .#default
```

### 2. Apply Configs

```bash
./install.sh
```

### Uninstall

```bash
./uninstall.sh
```

## Directory Structure

```
dotfiles/
├── alacritty/          → Terminal
├── fastfetch/          → System info
├── i3/                 → Window manager
├── i3status/           → Status bar
├── iex/                → Elixir REPL
├── kitty/              → Terminal
├── nvim/               → Neovim
├── picom/              → Compositor
├── rofi/               → Launcher
├── scripts/            → Utilities
├── starship/           → Shell prompt
├── tmux/               → Multiplexer
├── zsh/                → Shell
├── flake.nix           → Nix dependencies
└── install.sh          → Setup script
```

## Features

- **Window Management**: i3 + picom + rofi
- **Editor**: Neovim with full LSP support
- **Shell**: zsh + starship
- **Terminal**: Alacritty & Kitty configs
- **Utils**: Custom scripts for wallpapers and monitor management

## Screenshots

<div align="center">
  <img src="./screenshots/rice-1.png" alt="i3 WM" width="49%"/>
  <img src="./screenshots/alacritty.png" alt="Fastfetch" width="49%"/>
</div>

<div align="center">
  <img src="./screenshots/nvim_plus_tmux.png" alt="Neovim+Tmux" width="49%"/>
  <img src="./screenshots/blank.png" alt="Clean Desktop" width="49%"/>
</div>

## Troubleshooting

- **Fonts**: Ensure `ttf-font-awesome` is installed if icons are missing.
- **Keybindings**: Review `i3/config` for conflicts.

## Scripts

> [!WARNING]
> Scripts in `scripts/` are experimental.

- `run.sh`: Universal runner for C, Go, Rust, Elixir, JS, and more.
- `start_tmux.sh`: Smart session manager (auto-attach/create) with logging.
- `set_wallpaper.sh`: Manages background images.
- `setup_monitors.sh`: Configures multi-monitor layouts.
- `steam`, `obs`, `zen`, etc.: Wrappers for Flatpak applications.

---

_Inspirations: [windots by ashish0kumar](https://github.com/ashish0kumar/windots) & [Windots by scottmckendry](https://github.com/scottmckendry/Windots)_
