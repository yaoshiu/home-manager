{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      crates = {
        enable = true;
        lazyLoad = {
          enable = true;
          settings.event = "BufRead Cargo.toml";
        };

        settings = {
          completion.crates.enabled = true;
          lsp = {
            enabled = true;
            actions = true;
            completion = true;
            hover = true;
          };
        };
      };

      rustaceanvim = {
        enable = true;
        lazyLoad = {
          enable = true;
          settings.ft = "rust";
        };
      };

      neotest = {
        settings = {
          adapters = [
            "try_require('rustaceanvim.neotest')"
          ];
        };
      };
    };

    extraConfigLua = ''
      function try_require(module)
        local ok, result = pcall(require, module)
        if ok then
          return result
        else
          return nil
        end
      end
    '';

    extraPackages = with pkgs; [
      vscode-extensions.vadimcn.vscode-lldb.adapter
      clippy
    ];
  };
}
