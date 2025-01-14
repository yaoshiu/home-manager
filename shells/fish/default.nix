{ ... }:
{
  programs.fish = {
    enable = true;
    functions = {
      fish_greeting = "";
      zroot = ''
        set root (git rev-parse --show-toplevel)
        if test -n "$root"
          cd "$root"
        else
          echo "Not a Git repository or no root found!"
        end
      '';
    };
    interactiveShellInit = ''
      fish_vi_key_bindings
      set fish_cursor_insert line
    '';
  };
}
