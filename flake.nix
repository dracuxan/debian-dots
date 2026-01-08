{
  description = "System-wide tools via Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    packages.${system}.default = pkgs.buildEnv {
      name = "system-tools";

      paths = with pkgs; [
        # editors / shell
        neovim
        tmux

        # cli utils
        ripgrep
        fd
        bat
        eza
        btop
        curl
        wget
        git

        # dev tools
        gcc
        gnumake
        pkg-config
        go
        nodejs_20
        docker
        docker-compose

        # BEAM
        elixir
        erlang
        elixir-ls
      ];
    };
  };
}

