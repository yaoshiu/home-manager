{ ... }:
{
  programs.nixvim = {
    plugins.bufferline = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
        options = {
          close_command.__raw = "function(n) Snacks.bufdelete(n) end";
          right_mouse_command.__raw = "function(n) Snacks.bufdelete(n) end";
          diagnostics = "nvim_lsp";
          always_show_bufferline = false;
          offsets = [
            {
              filetype = "neo-tree";
              text = "Neo-tree";
              highlight = "Directory";
              text_align = "left";
            }
            {
              filetype = "snacks_layout_box";
            }
          ];
        };
      };
    };
  };
}
