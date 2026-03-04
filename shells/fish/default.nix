{ ... }:
{
  programs.fish = {
    enable = true;
    preferAbbrs = true;
    shellAbbrs = {
      cmd = "command";
    };
    functions = {
      fish_greeting = "";
    };
    interactiveShellInit = ''
      set -g fish_key_bindings fish_vi_key_bindings
    '';
  };
}
