.PHONY: config install clean

install:
	@echo "[+] Running install.sh..."
	@bash scripts/install.sh

setup:
	@echo "[+] Copying start_tmux.sh..."
	@sudo cp scripts/start_tmux.sh /usr/local/bin/tm

clean:
	@echo "[+] Unstowing everything..."
	stow -D -d . -t $(HOME) tmux zsh
	stow -D -d . -t $(HOME)/.config/nvim nvim
	stow -D -d . -t $(HOME)/.config/alacritty alacritty
	stow -D -d . -t $(HOME)/.config/fastfetch fastfetch
