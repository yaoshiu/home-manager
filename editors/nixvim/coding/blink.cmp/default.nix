{ ... }:
{
  programs.nixvim = {
    plugins.blink-cmp = {
      enable = true;

      lazyLoad = {
        settings = {
          event = "InsertEnter";
        };
      };

      settings = {
        keymap = {
          preset = "super-tab";
          "<Tab>" = [
            "select_next"
            "snippet_forward"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "snippet_backward"
            "fallback"
          ];
          "<CR>" = [
            "accept"
            "fallback"
          ];
        };
        completion = {
          list.selection = {
            auto_insert = true;
            preselect = false;
          };
          documentation.auto_show = true;
        };
      };
    };
  };
}
