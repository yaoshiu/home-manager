{ pkgs, ... }:
{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    noto-fonts-extra

    liberation_ttf
    dejavu_fonts
    roboto

    source-han-sans-simplified-chinese
    source-han-serif-simplified-chinese
    source-han-sans-traditional-chinese
    source-han-serif-traditional-chinese
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    wqy_microhei
    wqy_zenhei
    arphic-ukai
    arphic-uming

    maple-mono.NF
  ];

  fonts.fontconfig.enable = true;
}
