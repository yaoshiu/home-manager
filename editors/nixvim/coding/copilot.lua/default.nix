{ ... }:
{
  programs.nixvim = {
    plugins.copilot-lua = {
      enable = true;
      lazyLoad.settings.event = "InsertEnter";
      settings = {
        suggestion = {
          enabled = true;
          autoTrigger = true;
        };
        panel = {
          enabled = true;
          autoRefresh = true;
        };
      };
    };
  };
}
