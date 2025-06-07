{ ... }:
{
  programs.nixvim = {
    plugins = {
      gitsigns = {
        enable = true;
        lazyLoad.settings = {
          before.__raw = ''
            function()
              Snacks.toggle({
                name = "Git Signs",
                get = function()
                  return require("gitsigns.config").config.signcolumn
                end,
                set = function(state)
                  require("gitsigns").toggle_signs(state)
                end,
              }):map("<leader>uG")
            end
          '';
          event = "DeferredUIEnter";
        };

        settings = {
          signs = {
            add = {
              text = "▎";
            };
            change = {
              text = "▎";
            };
            delete = {
              text = "";
            };
            topdelete = {
              text = "";
            };
            changedelete = {
              text = "▎";
            };
            untracked = {
              text = "▎";
            };
          };

          signs_staged = {
            add = {
              text = "▎";
            };
            change = {
              text = "▎";
            };
            delete = {
              text = "";
            };
            topdelete = {
              text = "";
            };
            changedelete = {
              text = "▎";
            };
          };
        };
      };
    };
  };
}
