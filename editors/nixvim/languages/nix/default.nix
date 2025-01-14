{ pkgs, ... }:
{
  programs.nixvim = {
    plugins.lsp.servers.nixd = {
      enable = true;
    };

    plugins.conform-nvim.settings.formatters_by_ft = {
      nix = [ "nixfmt" ];
    };

    extraPackages = with pkgs; [
      nixfmt-rfc-style
    ];
  };
}
