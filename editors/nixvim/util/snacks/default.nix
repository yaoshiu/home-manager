{ ... }:
{
  programs.nixvim = {
    plugins.snacks = {
      settings = {
        bigfile.enabled = true;
        quickfile.enabled = true;
      };
    };
  };
}
