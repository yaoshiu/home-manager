{ ... }:
{
  programs.nixvim = {
    plugins.gitsigns = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
