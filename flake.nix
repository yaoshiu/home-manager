{
  description = "Home Manager configuration of huangyifei";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      flake-parts,
      home-manager,
      treefmt-nix,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, ... }:
      {
        imports = [
          home-manager.flakeModules.home-manager
          treefmt-nix.flakeModule
        ];

        systems = [
          "aarch64-darwin"
          "x86_64-linux"
        ];

        flake = {
          homeConfigurations =
            let
              common = [
                ./tools
                ./shells
                ./editors

                (
                  { pkgs, ... }:
                  {
                    nix = {
                      channels = {
                        inherit nixpkgs;
                      };
                      package = pkgs.nix;
                      gc.automatic = true;
                      settings = {
                        max-jobs = "auto";

                        experimental-features = [
                          "nix-command"
                          "flakes"
                        ];
                        substituters = [
                          "https://nix-community.cachix.org"
                          "https://cache.nixos.org/"
                          "https://helix.cachix.org"
                        ];
                        trusted-public-keys = [
                          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
                          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                          "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
                        ];
                      };
                    };

                    nixpkgs.overlays = [
                      inputs.helix.overlays.default
                    ];
                  }
                )
              ];
            in
            {
              macos = withSystem "aarch64-darwin" (
                { pkgs, ... }:
                home-manager.lib.homeManagerConfiguration {
                  inherit pkgs;
                  modules = common ++ [
                    ./applications
                    ./macos.nix
                  ];
                }
              );

              wsl = withSystem "x86_64-linux" (
                { pkgs, ... }:
                home-manager.lib.homeManagerConfiguration {
                  inherit pkgs;
                  modules = common ++ [
                    ./wsl.nix
                  ];
                }
              );
            };
        };

        perSystem = {
          treefmt = {
            programs.nixfmt.enable = true;
          };
        };
      }
    );
}
