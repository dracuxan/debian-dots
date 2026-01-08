{ pkgs }:

pkgs.buildEnv {
  name = "cli-tools";

  paths = with pkgs; [
    ripgrep
    fd
    bat
    eza
    neovim
    tmux
  ];
}

