{ ... }:
{
  imports = [
    ./neoconf
  ];

  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      inlayHints = true;

      keymaps = {
        lspBuf = {
          K = "hover";
          gr = "references";
          gD = "declaration";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
          "<leader>ca" = "code_action";
          "<leader>cr" = "rename";
        };
      };
    };
  };
}
