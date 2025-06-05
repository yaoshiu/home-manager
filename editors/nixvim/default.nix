{ pkgs, ... }:
{
  imports = [
    ./coding
    ./dap
    ./editor
    ./formatting
    ./languages
    ./linting
    ./lsp
    ./test
    ./treesitter
    ./ui
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

    clipboard = {
      providers.wl-copy.enable = true;
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
      exrc = true;
    };

    plugins = {
      lz-n = {
        enable = true;
      };
    };
  };
}
