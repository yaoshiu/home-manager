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
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
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
                ./ai
                ./tools
                ./shells
                ./editors

                {
                  nix = {
                    channels = {
                      inherit nixpkgs;
                    };
                  };

                  nixpkgs.overlays = [
                    inputs.helix.overlays.default
                    inputs.neovim-nightly-overlay.overlays.default
                  ];
                }
              ];
            in
            {
              "huangyifei@huangyifeis-MacBook-Pro.local" = withSystem "aarch64-darwin" (
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
            programs.stylua.enable = true;
          };
        };
      }
    );
}
