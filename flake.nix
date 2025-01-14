{
  description = "Home Manager configuration of yaoshiu";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      flake-utils,
      treefmt-nix,
    }:
    {
      homeConfigurations."yaoshiu" =
        let
          system = "x86_64-linux";
          pkgs = nixpkgs.legacyPackages.${system};
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            ./home.nix

            nixvim.homeManagerModules.nixvim

            ./editors
            ./shells
            ./dev
            ./apps
          ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
    }
    // flake-utils.lib.eachDefaultSystem (system: {
      formatter = treefmt-nix.lib.mkWrapper nixpkgs.legacyPackages.${system} {
        projectRootFile = "flake.nix";
        programs.nixfmt.enable = true;
      };
    });
}
