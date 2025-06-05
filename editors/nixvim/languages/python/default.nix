{ ... }:
{
  programs.nixvim = {
    plugins = {
      lsp.servers = {
        pyright = {
          enable = true;
        };
        ruff = {
          enable = true;
        };
      };

      neotest = {
        adapters.python = {
          enable = true;
        };
      };

      dap-python = {
        enable = true;
      };
    };
  };
}
