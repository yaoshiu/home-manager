{
  # User cache preferences shared by macOS and Linux. Extend system defaults.
  # The daemon's trusted-users/trusted-substituters still determine access.
  nix.settings = {
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org/"
    ];
    extra-trusted-substituters = [
      "s3://tsuru-nix-cache?region=ap-northeast-1"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-cache.tsuru.capital:wKfexrjnaD4lOdg7+TrUX2QYgbiDOV63gd9sOWEc2BY="
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
  };
}
