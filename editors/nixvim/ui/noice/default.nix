{ ... }:
{
  programs.nixvim = {
    plugins.noice = {
      enable = true;
      lazyLoad.settings = {
        event = "DeferredUIEnter";
        keys = [
          {
            __unkeyed-1 = "<leader>sn";
            __unkeyed-2 = "";
            desc = "+noice";
          }
          {
            __unkeyed-1 = "<leader>snl";
            __unkeyed-2 = "<cmd>Noice last<cr>";
            desc = "Noice Last Message";
          }
          {
            __unkeyed-1 = "<leader>snh";
            __unkeyed-2 = "<cmd>Noice history<cr>";
            desc = "Noice History";
          }
          {
            __unkeyed-1 = "<leader>sna";
            __unkeyed-2 = "<cmd>Noice all<cr>";
            desc = "Noice All";
          }
          {
            __unkeyed-1 = "<leader>snd";
            __unkeyed-2 = "<cmd>Noice dismiss<cr>";
            desc = "Dismiss All";
          }
        ];
      };

      settings = {
        lsp.override = {
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
          "cmp.entry.get_documentation" = true;
        };
        routes = [
          {
            filter = {
              event = "msg_show";
              any = [
                {
                  find = "%d+L, %d+B";
                }
                {
                  find = "; after #%d+";
                }
                {
                  find = "; before #%d+";
                }
              ];
            };
            view = "mini";
          }
        ];
        presets = {
          bottom_search = true;
          command_palette = true;
          long_message_to_split = true;
        };
      };
    };
  };
}
