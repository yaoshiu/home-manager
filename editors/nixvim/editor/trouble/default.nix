{ ... }:
{
  programs.nixvim = {
    plugins.trouble = {
      enable = true;
      lazyLoad.settings = {
        cmd = "Trouble";
        keys = [
          {
            __unkeyed-1 = "<leader>x";
            __unkeyed-2 = "";
            desc = "+trouble";
          }
          {
            __unkeyed-1 = "<leader>xx";
            __unkeyed-2 = "<cmd>Trouble diagnostics toggle<cr>";
            desc = "Diagnostics";
          }
          {
            __unkeyed-1 = "<leader>xX";
            __unkeyed-2 = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
            desc = "Buffer Diagnostics";
          }
        ];
      };
    };
  };
}
