.PHONY: config install dwm all clean

install:
	@echo "[+] Running install.sh..."
	@bash install.sh

clean:
	@echo "[+] Unstowing everything..."
	stow -D -d . -t $(HOME) tmux zsh
	stow -D -d . -t $(HOME)/.config/nvim nvim
	stow -D -d . -t $(HOME)/.config/alacritty alacritty
	stow -D -d . -t $(HOME)/.config/fastfetch fastfetch
