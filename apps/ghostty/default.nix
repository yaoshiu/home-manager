{ ... }:
{
  programs.ghostty = {
    enable = true;
    installBatSyntax = true;
    installVimSyntax = true;

    settings = {
      theme = "catppuccin-macchiato";
      font-size = 14;
      font-family = "Maple Mono NF";
      font-feature = [
        "calt"
        "cv03"
        "cv63"
        "zero"
      ];

      window-padding-x = 16;
      window-padding-y = 16;
      window-padding-balance = true;

      mouse-scroll-multiplier = 0.5;
    };
  };
}
