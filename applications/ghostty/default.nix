{ pkgs, ... }: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;
    settings = {
      font-size = 14;
      font-family = "Hack Nerd Font Mono";
      theme = "Gruvbox Material Dark";
      window-padding-x = 16;
      window-padding-y = 16;
      window-padding-balance = true;
      macos-auto-secure-input = true;
      clipboard-read = "allow";
      clipboard-write = "allow";
      macos-option-as-alt = true;
      shell-integration-features = true;
    };
  };
}
