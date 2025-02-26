{ ... }:
{
  programs.nixvim = {
    plugins.lazydev = {
      enable = true;
      lazyLoad.settings = {
        cmd = "LazyDev";
        ft = "lua";
      };
    };
  };
}
