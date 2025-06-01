{ pkgs, ... }:
{
  imports = [
    ./fish
  ];

  programs = {
    bash = {
      enable = true;
      initExtra = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };

    starship.enable = true;

    zoxide.enable = true;

    direnv.enable = true;

    nix-your-shell.enable = true;

    nix-index.enable = true;
  };
}
