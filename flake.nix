{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        inherit (pkgs) lib;
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
        build-templates = pkgs.writeShellApplication rec {
          name = "build-templates";
          runtimeInputs = [
            extract-base-template
            extract-realism-templates
            make-base-template
            make-realism-templates
          ];
          text = ''
            if test "$#" != 1; then
              echo "Usage: ${name} <path to mod directory>" >&2
              exit 1
            fi
            modDir=$1
            extract-realism-templates "$modDir"
            extract-base-template "$modDir"
            make-realism-templates
            make-base-template
          '';
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
                build-templates
                pkgs.nixfmt-rfc-style
              ]
            );
        };
      in
      {
        apps.default = {
          type = "app";
          program = "${lib.getExe self.packages.${system}.default}";
        };
        packages.default = pkgs.haskellPackages.developPackage package;
        devShells.default = pkgs.haskellPackages.developPackage (package // { returnShellEnv = true; });
      }
    );
}
