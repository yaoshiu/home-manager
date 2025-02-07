{ ... }:
{
  imports = [
    ./coding
    ./editor
    ./languages
    ./lsp
    ./ui
    ./formatting
    ./linting
    ./treesitter
    ./mini.nix
    ./keymaps.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.tokyonight = {
      enable = true;
      lazyLoad.enable = true;
    };

    globals = {
      mapleader = " ";
      maplocalleader = "\\";
    };

    opts = {
      confirm = true;
      cursorline = true;
      expandtab = true;
      shiftround = true;
      shiftwidth = 2;
      smartindent = true;
      smoothscroll = true;
      relativenumber = true;
      signcolumn = "yes";
    };

    performance = {
      byteCompileLua = {
        enable = true;
        configs = true;
        initLua = true;
        nvimRuntime = true;
        plugins = true;
      };
    };

    plugins = {
      lz-n = {
        enable = true;
      };
    };
  };
}
