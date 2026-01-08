{ lib, ... }: {
  programs.fish = {
    enable = true;
    preferAbbrs = true;
    functions = {
      fish_greeting = "";
    };
    interactiveShellInit = ''
      set -g fish_key_bindings fish_vi_key_bindings
    '';
  };

  programs.zsh = {
    initContent = lib.mkAfter ''
      if [[ $(ps -o command= -p "$PPID" | awk '{print $1}') != 'fish' ]]; then
        exec fish -l
      fi
    '';
  };
}
