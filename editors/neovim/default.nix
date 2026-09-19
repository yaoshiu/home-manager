{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    extraPackages = with pkgs; [
      luarocks
      tree-sitter
      lua-language-server
      cargo
      rustc
      nixd
      nixfmt
      rust-analyzer
      stylua
    ];
  };
  xdg.configFile.nvim = {
    recursive = true;
    source = ./config;
  };
}
