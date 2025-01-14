{ ... }:
{
  programs.nixvim = {
    plugins.mini.modules = {
      pairs = {
        modes = {
          command = true;
          terminal = true;
          skip_ts = [ "string" ];
          skip_unbalanced = true;
          markdown = true;
        };
      };
    };
  };
}
