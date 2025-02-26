[![wakatime](https://wakatime.com/badge/user/0d75cfc5-da70-41b7-b8c8-661ef9d8338b/project/9358976a-67c2-4357-8140-bd4a4c743b96.svg)](https://wakatime.com/badge/user/0d75cfc5-da70-41b7-b8c8-661ef9d8338b/project/9358976a-67c2-4357-8140-bd4a4c743b96)

# Dotfiles
Dotfiles for my WSL setup. Supports automatic installation of dependencies and configuration of Neovim, Fastfetch and Starship!

## ✅ Pre-requisites
You can install these manually, but if you're using Ubuntu or Arch, they will be installed through the script (except Starship).
- [Neovim (v0.8 or higher)](https://neovim.io/)
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)
- [Starship](https://starship.rs/)

If you want Language Server Protocol (LSP) support, install the necessary runtimes:
- [Node.js](https://nodejs.org/)
- [Python](https://www.python.org/)
- [Go](https://go.dev/)
- [Elixir](https://elixir-lang.org/)
- [Rust](https://www.rust-lang.org/)

## 📁 Directory Structure

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
├── install.sh ................ (Installation Script)
├── LICENSE
├── README.md ................. (Docs)
└── starship
    └── starship.toml ......... (Starship Config)
```

## 🚀 Installation

> [!WARNING]\
> Under _**active development**_, expect changes. Existing configuration files will be overwritten. Please make a backup of any files you wish to keep before proceeding.
> Compatable Package Managers: apt and pacman

1. Clone the repository to your preferred location: 

```
git clone https://github.com/Nisarg2061/Dot-Files.git ~/dotfiles && cd ~/dotfiles
```

2. Run the script on your terminal:

```
./install.sh
```
    
## 📸 Screenshots
![Preview](https://github.com/user-attachments/assets/9d7a8281-d5b7-42e5-bd56-5a63797093cc)
