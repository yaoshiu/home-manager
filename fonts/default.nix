{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    maple-mono.NF
  ];

  fonts.fontconfig.enable = true;
}
