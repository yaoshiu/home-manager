{ ... }:
{
  programs.nixvim = {
    plugins.ts-autotag = {
      enable = true;
      lazyLoad.settings.event = "InsertEnter";
    };
  };
}
