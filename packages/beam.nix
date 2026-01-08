{ pkgs }:

pkgs.buildEnv {
  name = "beam-tools";

  paths = [
    pkgs.beam.packages.erlang_26.elixir_1_17
  ];
}
