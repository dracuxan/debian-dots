# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
autoload -Uz +X compinit && compinit

## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Enable keybindings in Zsh
bindkey -v  # Use Vim keybindings in Zsh

# ALT + H (Move Left)
bindkey '^[h' backward-char

# ALT + L (Move Right)
bindkey '^[l' forward-char

# ALT + J (Move Down in history)
bindkey '^[j' down-line-or-history

# ALT + K (Move Up in history)
bindkey '^[k' up-line-or-history

#Disabeling arrow keys
bindkey -r "^[[A"  # Remove Up Arrow
bindkey -r "^[[B"  # Remove Down Arrow
bindkey -r "^[[C"  # Remove Right Arrow
bindkey -r "^[[D"  # Remove Left Arrow

# Exports and Alias
# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000

# force zsh to show the complete history
alias history="history 0"

# Some more ls aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias ld='du -h -d 1'
alias nv='nvim'
alias neo='clear; fastfetch'
alias noe='neo'
alias tr='tree -Ld 1'
alias x='exit'

# Zig environment variables
export PATH="$PATH:$HOME/zig/bin"

# Go environment variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin

# Add Go binaries to PATH
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# Protoc Variables
export PATH="$PATH:$HOME/.local/bin/protoc"
. "$HOME/.cargo/env"

# NVM Variables
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Load NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Load NVM bash_completion (optional)

# Neovim Variables
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Bash Scripts
export BASHROOT=/usr/local/bash/bin
export PATH=$PATH:$BASHROOT
export PATH="$HOME/.local/bin:$PATH"

# Fastfetch Variables
export LOGO_DIR="$HOME/.config/fastfetch/logos/"

# Emacs path
export PATH="$HOME/.emacs.d/bin:$PATH" 

# Git aliases
alias gitupd='git add .; git commit -m "upd"; git push'
alias gitnew='git add .; git commit -m "new"; git push'
alias gitadd='git add .; git commit -m "add"; git push'
alias gitfix='git add .; git commit -m "fix"; git push'
alias gitrebase='git pull --rebase'
alias gitbat='git add .; git commit -m "Batman"; git push'
alias ga="git add .;"
alias gc="git commit -m"
alias gp="git push"

# Python alias
alias py='python3'

# Nuclei alias
alias nuke='nuclei'
alias ff='firefox'
alias tm='tmux attach -t tmux || tmux new -s tmux'

# Startup Commands
alias neo='clear; fastfetch'
eval "$(starship init zsh)"
neo
