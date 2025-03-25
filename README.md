[![wakatime](https://wakatime.com/badge/user/0d75cfc5-da70-41b7-b8c8-661ef9d8338b/project/9358976a-67c2-4357-8140-bd4a4c743b96.svg)](https://wakatime.com/badge/user/0d75cfc5-da70-41b7-b8c8-661ef9d8338b/project/9358976a-67c2-4357-8140-bd4a4c743b96)

# Dotfiles

Dotfiles for my WSL setup. Supports automatic installation of dependencies and configuration of Neovim, Fastfetch and Starship!

## ✅ Pre-requisites

You can install these manually, but if you're using Arch, they can be installed through the script.

- [Neovim (v0.8 or higher)](https://neovim.io/)
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Starship](https://starship.rs/)

If you want Language Server Protocol (LSP) support, install the necessary runtimes (Installation included in the script):

- [Go](https://go.dev/)
- [Rust](https://www.rust-lang.org/)
- [Clang](https://clang.llvm.org/)
- [Node.js](https://nodejs.org/)
- [Python](https://www.python.org/)

## 📁 Directory Structure

```
dotfiles
├── fastfetch
│   ├── config.jsonc .......... (Fastfetch Config)
│   └── logos ................. (Custom Logos)
├── nvim
│   ├── lua
│   │   ├── core .............. (Core Config)
│   │   └── plugins ........... (Custom Plugin Configs)
│   └── init.lua .............. (Main Init File)
├── starship
│   └── starship.toml ......... (Starship Config)
├── config.sh ................. (Dependency Installer)
├── install.sh ................ (Configuration Setup)
├── LICENSE
└── README.md ................. (Documentation)
```

## 🚀 Installation

> [!WARNING]\
> Under _**active development**_, expect changes. Existing configuration files will be overwritten. Please make a backup of any files you wish to keep before proceeding.
> Compatable Package Managers: pacman

1. Clone the repository to your preferred location:

```
git clone https://github.com/dracuxan/Dot-Files.git ~/dotfiles && cd ~/dotfiles
```

2. Install dependencies (only if needed!):

```
./install.sh
```

3. Configure the tools:

```
./config.sh
```

## 📸 Screenshots

![Fastfetch](https://github.com/user-attachments/assets/31804d54-ff43-45c6-8f1b-79e3ae28cd0d)
![Neovim](https://github.com/user-attachments/assets/cb92ce16-dd48-48de-aea7-0d83d5bd2709)
![Neovim](https://github.com/user-attachments/assets/ab2f30a2-6305-4d98-af52-cd81d4dc5b1f)
