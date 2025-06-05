{ ... }:
{
  programs.nixvim = {
    plugins.telescope = {
      enable = true;
      lazyLoad.settings = {
        cmd = "Telescope";
        keys = [
          {
            __unkeyed-1 = "<leader>s";
            __unkeyed-2 = "";
            desc = "+search";
          }
          {
            __unkeyed-1 = "<leader>f";
            __unkeyed-2 = "";
            desc = "+find";
          }
          {
            __unkeyed-1 = "<leader>sk";
            __unkeyed-2 = "<cmd>Telescope keymaps<cr>";
            desc = "Key Maps";
          }
          {
            __unkeyed-1 = "<leader>ff";
            __unkeyed-2 = "<cmd>lua require('telescope.builtin').find_files({ cwd = Snacks.git.get_root() })<cr>";
            desc = "Find Files (Root Dir)";
          }
          {
            __unkeyed-1 = "<leader> ";
            __unkeyed-2 = "<leader>ff";
            desc = "Find Files (Root Dir)";
            remap = true;
          }
          {
            __unkeyed-1 = "<leader>fF";
            __unkeyed-2 = "<cmd>Telescope find_files<cr>";
            desc = "Find Files (cwd)";
          }
          {
            __unkeyed-1 = "<leader>sC";
            __unkeyed-2 = "<cmd>Telescope commands<cr>";
            desc = "Commands";
          }
        ];
      };
    };
  };
}
