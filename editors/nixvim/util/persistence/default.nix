{ ... }:
{
  programs.nixvim = {
    plugins = {
      persistence = {
        enable = true;
        lazyLoad.settings.event = "BufReadPre";
      };
    };
  };
}
