{ config, pkgs, ... }:

{
  home.username = "yaoshiu";
  home.homeDirectory = "/home/yaoshiu";

  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    LANG = "zh_CN.UTF-8";
    LC_ALL = "zh_CN.UTF-8";
  };

  programs.home-manager.enable = true;
}
