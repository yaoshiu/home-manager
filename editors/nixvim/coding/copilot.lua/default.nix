{ ... }:
{
  programs.nixvim = {
    plugins.copilot-lua = {
      enable = true;
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
}
