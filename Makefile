.PHONY: config install dwm all clean

config:
	@echo "[+] Running config.sh..."
	@bash config.sh

install:
	@echo "[+] Running install.sh..."
	@bash install.sh

dwm:
	@echo "[+] Setting up DWM..."
	@bash setup/02-dwm.sh

all: config install dwm

clean:
	@echo "[+] Unstowing everything..."
	stow -D -d . -t $(HOME) tmux zsh
	stow -D -d . -t $(HOME)/.config/nvim nvim
	stow -D -d . -t $(HOME)/.config/alacritty alacritty
	stow -D -d . -t $(HOME)/.config/fastfetch fastfetch
	stow -D -d . -t $(HOME)/.config starship
