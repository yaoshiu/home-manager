{ ... }:
{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      closeIfLastWindow = true;
    };

    keymaps = [
      {
        action = "<cmd>Neotree toggle<cr>";
        key = "<leader>E";
        options.desc = "Explorer (cwd)";
      }
      {
        action = "<cmd>lua require('neo-tree.command').execute({ toggle = true, dir = Snacks.git.get_root() })<cr>";
        key = "<leader>e";
        options.desc = "Explorer (Root Dir)";
      }
    ];
  };
}
