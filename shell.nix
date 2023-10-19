{ pkgs ? import ./nix }:
let
  inherit (pkgs) ruby bundlerEnv;
  gems = bundlerEnv {
    name = "gems";
    inherit ruby;
    gemdir = ./.;
  };
in
pkgs.mkShell {
  buildInputs = with pkgs; [ jekyll ruby npins bundler bundix ];
}
