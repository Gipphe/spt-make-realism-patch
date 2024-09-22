{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        package = {
          name = "make-realism-patch";
          root = ./.;
          modifier =
            drv:
            pkgs.haskell.lib.addBuildTools drv (
              (with pkgs.haskellPackages; [
                cabal-fmt
                cabal-install
                fourmolu
                ghcid
                hpack
              ])
              ++ [ pkgs.nixfmt-rfc-style ]
            );
        };
      in
      {
        packages.default = pkgs.haskellPackages.developPackage package;
        devShells.default = pkgs.haskellPackages.developPackage (package // { returnShellEnv = true; });
      }
    );
}
