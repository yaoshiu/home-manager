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
  };

  outputs =
    {
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
        ];

        flake = {
          homeConfigurations = {
            macos = withSystem "aarch64-darwin" (
              { pkgs, ... }:
              home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                modules = [
                  ./home.nix
                  ./tools
                  ./shells
                  ./editors
                  ./applications
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
