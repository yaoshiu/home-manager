{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    source-han-serif-simplified-chinese
    wqy_zenhei

    maple-mono.NF
  ];

  fonts.fontconfig.enable = true;
}
