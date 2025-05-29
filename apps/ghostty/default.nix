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
    };
  };
}
