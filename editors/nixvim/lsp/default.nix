{ ... }:
{
  imports = [
    ./neoconf
  ];

  programs.nixvim = {
    plugins.lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        typos_lsp.enable = true;
      };

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
        extra = [
          {
            mode = "v";
            key = "<leader>ca";
            action = "<cmd>lua vim.lsp.buf.code_action()<cr>";
            options.desc = "Lsp buf code action";
          }
          {
            mode = [
              "n"
              "v"
            ];
            key = "<leader>c";
            action = "";
            options.desc = "+code";
          }
          {
            key = "<leader>cA";
            action = "<cmd>lua vim.lsp.buf.code_action({ apply = true, context = { only = { 'source' }, diagnostics = {} } })<cr>";
          }
        ];
      };
    };
  };
}
