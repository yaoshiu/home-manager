{ pkgs, ... }:
{
  nix = {
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
      ];
      trusted-substituters = [
        "s3://tsuru-nix-cache?region=ap-northeast-1"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-cache.tsuru.capital:wKfexrjnaD4lOdg7+TrUX2QYgbiDOV63gd9sOWEc2BY="
      ];
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
