{ pkgs, ... }:
{
  programs.lazygit = {
    enable = true;
  };

  home.packages = with pkgs; [
    # For clipboard operations
    wl-clipboard
  ];
}
