{ pkgs, ... }:
{
  programs.nixvim = {
    plugins = {
      lsp.servers = {
        ts_ls = {
          enable = true;
        };
        denols = {
          enable = true;
        };
      };

      conform-nvim.settings.formatters_by_ft =
        let
          supported = [
            "javascript"
            "typescript"
            "javascriptreact"
            "typescriptreact"
            "css"
            "json"
            "vue"
          ];
        in
        builtins.listToAttrs (
          map (supported: {
            name = supported;
            value = [ "prettier" ];
          }) supported
        );
    };

    extraPackages = with pkgs; [
      nodePackages.prettier
    ];
  };
}
