{ ... }:
{
  programs.nixvim = {
    plugins = {
      ts-comments = {
        lazyLoad.settings.event = "DeferredUIEnter";
        enable = true;
      };
    };
  };
}
