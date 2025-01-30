{ ... }:
{
  programs.nixvim = {
    plugins.lint = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
  };
}
