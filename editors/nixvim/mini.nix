{ ... }:
{
  programs.nixvim = {
    plugins.mini = {
      enable = true;

      lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
