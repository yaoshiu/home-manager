{ config, ... }: {
  programs.npm.enable = true;

  home.sessionPath = [
    "${config.programs.npm.settings.prefix}/bin"
  ];
}
