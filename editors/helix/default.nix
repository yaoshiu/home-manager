{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "gruvbox-material";
      editor = {
        bufferline = "multiple";
        line-number = "relative";
        cursorline = true;
        cursor-shape = {
          insert = "bar";
        };
        lsp = {
          display-progress-messages = true;
          display-inlay-hints = true;
        };
        whitespace.render = "all";
        indent-guides.render = true;
      };
    };

    languages = {
      language-server = {
        haskell-language-server.config = {
          haskell = {
            sessionLoading = "multipleComponents";
            plugin.hlint.diagnosticsOn = false;
          };
        };
      };
    };

    extraPackages = with pkgs; [
      clang-tools
      nixd
      nixfmt
      tombi
      taplo
      typescript-language-server
      bash-language-server
      shfmt
      shellcheck
      dockerfile-language-server
      rust-analyzer
      haskell-language-server
      ty
      ruff
    ];
  };
}
