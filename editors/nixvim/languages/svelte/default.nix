{ ... }:
{
  programs.nixvim = {
    plugins.lsp = {
      servers.svelte = {
        enable = true;
      };
    };
  };
}
