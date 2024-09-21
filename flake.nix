{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.haskellPackages.developPackage {
          name = "make-realism-patch";
          root = ./.;
          returnShellEnv = true;
          modifier =
            drv:
            pkgs.haskell.lib.addBuildTools drv (
              (with pkgs.haskellPackages; [
                cabal-install
                ghcid
                fourmolu
                cabal-fmt
              ])
              ++ [ pkgs.nixfmt-rfc-style ]
            );
        };
      }
    );
}
