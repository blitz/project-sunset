{
  description = "Project Sunset";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {

      systems = [
        "x86_64-linux"
      ];

      perSystem = { config, pkgs, ...}: {

        devShells.default = pkgs.mkShell {
          packages = [
            (pkgs.python3.withPackages (p: [ p.geopy p.overpy p.requests p.geographiclib p.ephem p.folium ]))
          ];
        };
      };
    };
}
