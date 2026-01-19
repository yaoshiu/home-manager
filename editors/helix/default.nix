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

    extraPackages = with pkgs; [
      nixd
      nixfmt
      bash-language-server
      shfmt
      shellcheck
    ];
  };
}
