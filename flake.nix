{
  description = "Nisarg's system toolchain (flakes-only)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    packages.${system} = {
      beam = import ./packages/beam.nix { inherit pkgs; };
      dev  = import ./packages/dev.nix  { inherit pkgs; };
      cli  = import ./packages/cli.nix  { inherit pkgs; };
    };
  };
}
