{ pkgs, ... }:
{
  programs.helix = {
    enable = true;

    extraPackages = with pkgs; [
      nil
      nixd
    ];

    settings = {
      editor = {
        cursorline = true;
        completion-replace = true;
        true-color = true;
        undercurl = true;
        color-modes = true;

        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };

        indent-guides = {
          render = true;
        };

        cursor-shape = {
          insert = "bar";
        };
      };

      theme = "tokyonight";
    };

    languages = {
      language = [
        {
          name = "nix";
          language-servers = [
            "nixd"
            "nil"
          ];
        }
      ];

      language-server = {
        nixd = {
          command = "nixd";
        };
      };
    };
  };
}
