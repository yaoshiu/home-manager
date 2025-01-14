{ ... }:
{
  programs.nixvim = {
    plugins.flash = {
      enable = true;
      lazyLoad.settings.keys = [
        {
          __unkeyed-1 = "s";
          __unkeyed-2 = "<cmd>lua require('flash').jump()<cr>";
          mode = [ "n" "x" "o" ];
          desc = "Flash";
        }
      {
        __unkeyed-2 = "<cmd>lua require('flash').treesitter()<cr>";
        __unkeyed-1 = "S";
        mode = [
          "n"
          "x"
          "o"
        ];
        desc = "Flash Treesitter";
      }
      {
        __unkeyed-2 = "<cmd>lua require('flash').remote()<cr>";
        __unkeyed-1 = "r";
        mode = [ "o" ];
        desc = "Remote Flash";
      }
      {
        __unkeyed-2 = "<cmd>lua require('flash').treesitter_search()<cr>";
        __unkeyed-1 = "R";
        mode = [ "o" ];
        desc = "Treesitter Search";
      }
      {
        __unkeyed-2 = "<cmd>lua require('flash').toggle()<cr>";
        __unkeyed-1 = "<c-s>";
        mode = [ "c" ];
        desc = "Toggle Flash Search";
      }
      ];
    };
  };
}
