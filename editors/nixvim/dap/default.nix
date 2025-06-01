{ ... }:
{
  programs.nixvim = {
    plugins = {
      dap-ui = {
        enable = true;
        lazyLoad.settings = {
          lazy = true;
        };
      };

      dap-virtual-text = {
        enable = true;
        lazyLoad.settings = {
          lazy = true;
        };
      };

      dap = {
        enable = true;
        lazyLoad.settings = {
          after = ''
            function()
              require('lz.n').trigger_load({
                'dap-ui',
                'dap-virtual-text',
              })
            end
          '';
          keys = [
            {
              __unkeyed-1 = "<leader>dB";
              __unkeyed-2 = "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>";
              desc = "Breakpoint Condition";
            }
            {
              __unkeyed-1 = "<leader>db";
              __unkeyed-2 = "<cmd>lua require('dap').toggle_breakpoint()<cr>";
              desc = "Toggle Breakpoint";
            }
            {
              __unkeyed-1 = "<leader>dc";
              __unkeyed-2 = "<cmd>lua require('dap').continue()<cr>";
              desc = "Run/Continue";
            }
            {
              __unkeyed-1 = "<leader>dC";
              __unkeyed-2 = "<cmd>lua require('dap').run_to_cursor()<cr>";
              desc = "Run to Cursor";
            }
            {
              __unkeyed-1 = "<leader>dg";
              __unkeyed-2 = "<cmd>lua require('dap').goto_()<cr>";
              desc = "Go to Line";
            }
            {
              __unkeyed-1 = "<leader>di";
              __unkeyed-2 = "<cmd>lua require('dap').step_into()<cr>";
              desc = "Step Into";
            }
            {
              __unkeyed-1 = "<leader>dj";
              __unkeyed-2 = "<cmd>lua require('dap').down()<cr>";
              desc = "Down";
            }
            {
              __unkeyed-1 = "<leader>dk";
              __unkeyed-2 = "<cmd>lua require('dap').up()<cr>";
              desc = "Up";
            }
            {
              __unkeyed-1 = "<leader>dl";
              __unkeyed-2 = "<cmd>lua require('dap').run_last()<cr>";
              desc = "Run Last";
            }
            {
              __unkeyed-1 = "<leader>do";
              __unkeyed-2 = "<cmd>lua require('dap').step_out()<cr>";
              desc = "Step Out";
            }
            {
              __unkeyed-1 = "<leader>dO";
              __unkeyed-2 = "<cmd>lua require('dap').step_over()<cr>";
              desc = "Step Over";
            }
            {
              __unkeyed-1 = "<leader>dP";
              __unkeyed-2 = "<cmd>lua require('dap').pause()<cr>";
              desc = "Pause";
            }
            {
              __unkeyed-1 = "<leader>dr";
              __unkeyed-2 = "<cmd>lua require('dap').repl.toggle()<cr>";
              desc = "Toggle REPL";
            }
            {
              __unkeyed-1 = "<leader>ds";
              __unkeyed-2 = "<cmd>lua require('dap').session()<cr>";
              desc = "Session";
            }
            {
              __unkeyed-1 = "<leader>dt";
              __unkeyed-2 = "<cmd>lua require('dap').terminate()<cr>";
              desc = "Terminate";
            }
          ];
        };
      };
    };
  };
}
