{ ... }:
{
  programs.nixvim = {
    plugins.trouble = {
      enable = true;
      lazyLoad.settings.cmd = "Trouble";
    };
  };
}
