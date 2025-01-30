{ ... }:
{
  programs.nixvim = {
    plugins.snacks = {
      enable = true;
      settings = {
        indent.enabled = true;
        input.enabled = true;
        notifier.enabled = true;
        scope.enabled = true;
        words.enabled = true;
        bigfile.enabled = true;
        quickfile.enabled = true;
      };
    };
  };
}
