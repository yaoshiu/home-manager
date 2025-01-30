{ ... }:
{
  programs.nixvim = {
    plugins.lsp.servers = {
      astro = {
        enable = true;
      };
    };
  };
}
