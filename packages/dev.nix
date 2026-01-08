{ pkgs }:

pkgs.buildEnv {
  name = "dev-tools";

  paths = with pkgs; [
    git
    gnumake
    gcc
    nodejs_20
    docker-compose
  ];
}

