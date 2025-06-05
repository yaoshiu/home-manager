{ ... }:
{
  programs.nixvim = {
    plugins = {
      lsp.servers.tailwindcss = {
        enable = true;
      };

      colorizer = {
        settings = {
          tailwind = true;
        };
      };
    };
  };
}
