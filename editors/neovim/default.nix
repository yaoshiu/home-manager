{ ... }: {
  programs.neovim = {
    enable = true;
  };
  xdg.configFile.nvim = {
    recursive = true;
    source = ./config;
  };
}
