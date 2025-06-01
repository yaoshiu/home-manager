{ ... }:
{
  programs.nixvim = {
    plugins = {
      neotest = {
        enable = true;
        lazyLoad.settings = {
          event = "DeferredUIEnter";
        };
        settings = {
          status = {
            virtual_text = true;
          };
        };
      };
    };
  };
}
