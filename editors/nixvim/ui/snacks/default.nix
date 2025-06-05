{ pkgs, ... }:
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
        picker.enabled = true;
      };
    };

    keymaps = [
      {
        action = "";
        key = "<leader>b";
        options.desc = "+buffer";
      }
      {
        action = "<cmd>lua require('snacks').bufdelete()<cr>";
        key = "<leader>bd";
        options.desc = "Delete Buffer";
      }
      {
        action = "<cmd>lua require('snacks').bufdelete.others()<cr>";
        key = "<leader>bo";
        options.desc = "Delete Other Buffers";
      }
    ];

    extraPackages = with pkgs; [ imagemagick ];
  };
}
