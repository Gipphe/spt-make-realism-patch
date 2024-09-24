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
        createTemplates = pkgs.writeShellApplication {
          name = "create-templates";
          runtimeInputs = with pkgs; [
            fd
            fish
            jq
            ripgrep
          ];
          text = "fish --no-config ${./scripts/make-templates.fish} \"$@\"; exit $?";
        };
        makeSnippets = pkgs.writeShellApplication {
          name = "make-snippets";
          runtimeInputs = with pkgs; [
            gnused
            gawk
          ];
          text = "fish --no-config ${./scripts/make-hs-snippets.fish} \"$@\"; exit $?";
        };
        package = {
          name = "make-realism-patch";
          root = ./.;
          modifier =
            drv:
            pkgs.haskell.lib.addBuildTools drv (
              (with pkgs.haskellPackages; [
                cabal-fmt
                cabal-install
                createTemplates
                fourmolu
                ghcid
                hlint
                hpack
                makeSnippets
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
