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
        extract-realism-templates = pkgs.writeShellApplication {
          name = "extract-realism-templates";
          runtimeInputs = with pkgs; [
            fd
            fish
            jq
            ripgrep
          ];
          text = "fish --no-config \"${./scripts/extract-realism-templates.fish}\" \"$@\"; exit $?";
        };
        make-realism-templates = pkgs.writeShellApplication {
          name = "make-realism-templates";
          runtimeInputs = with pkgs; [
            gnused
            gawk
          ];
          text = "fish --no-config \"${./scripts/make-realism-templates.fish}\" \"$@\"; exit $?";
        };
        extract-base-template = pkgs.writeShellApplication {
          name = "extract-base-template";
          runtimeInputs = with pkgs; [
            fd
            jq
          ];
          text = "fish --no-config \"${./scripts/extract-base-template.fish}\" \"$@\"; exit $?";
        };
        make-base-template = pkgs.writeShellApplication {
          name = "make-base-template";
          runtimeInputs = with pkgs; [
            jq
            gnused
            gawk
          ];
          text = "fish --no-config \"${./scripts/make-base-template.fish}\" \"$@\"; exit $?";
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
                fourmolu
                ghcid
                hlint
                hpack
              ])
              ++ [
                extract-base-template
                extract-realism-templates
                make-base-template
                make-realism-templates
                pkgs.nixfmt-rfc-style
              ]
            );
        };
      in
      {
        packages.default = pkgs.haskellPackages.developPackage package;
        devShells.default = pkgs.haskellPackages.developPackage (package // { returnShellEnv = true; });
      }
    );
}
