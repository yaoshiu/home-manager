{ ... }:
{
  programs.nixvim = {
    plugins.nui = {

      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
