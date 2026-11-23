{
  description = "A small package tree for merge-policy acceptance tests";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
    vug.url = "github:conao3/rust-vug/93ed787e82ff24369f1d8352889ef8fedbb90b29";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];
      imports = [ inputs.treefmt-nix.flakeModule ];
      perSystem =
        { pkgs, system, ... }:
        let
          vug = inputs.vug.packages.${system}.default;
        in
        {
          treefmt = {
            projectRootFile = "flake.nix";
            programs.nixfmt.enable = true;
          };
          packages.default = pkgs.writeShellApplication {
            name = "check-tree";
            text = ''exec ${vug}/bin/vug record check-tree --root "''${1:-.}"'';
          };
          devShells.default = pkgs.mkShell {
            packages = [
              vug
              pkgs.gnumake
            ];
          };
        };
    };
}
