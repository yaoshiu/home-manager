{ ... }:
{
  programs.nixvim = {
    plugins.which-key = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
    };
    keymaps = [
      {
        action = "<cmd>lua require('which-key').show({ global = false })<cr>";
        key = "<leader>?";
        options.desc = "Buffer Local Keymaps (which-key)";
      }
    ];
  };
}
