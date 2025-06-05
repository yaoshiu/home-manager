{ ... }:
{
  programs.nixvim = {
    plugins = {
      colorizer = {
        enable = true;
        lazyLoad.settings.event = "DeferredUIEnter";
      };
    };
  };
}
