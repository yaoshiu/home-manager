{ ... }:
{
  programs.nixvim = {
    plugins.copilot-lua = {
      enable = true;
      lazyLoad.settings.event = "InsertEnter";
      settings = {
        suggestion = {
          enabled = true;
          auto_trigger = true;
        };
        panel = {
          enabled = true;
          auto_refresh = true;
        };
      };
    };
  };
}
