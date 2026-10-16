{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.hostPlatform.isDarwin then pkgs.ghostty-bin else pkgs.ghostty;
    settings = {
      font-size = 14;
      font-family = "JetBrainsMono Nerd Font Mono";
      command = "direct:zsh -lic fish";
      theme = "Zenbones";
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

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    monaspace
  ];
}
