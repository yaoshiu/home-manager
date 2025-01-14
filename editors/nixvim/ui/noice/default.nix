{ ... }:
{
  programs.nixvim = {
    plugins.noice = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";

      settings = {
        lsp.override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
        };
      };
    };
  };
}
