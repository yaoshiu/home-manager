{ ... }:
{
  programs.nixvim = {
    plugins = {
      dap-ui = {
        enable = true;
        lazyLoad.settings = {
          before = ''
            function()
              require('lz.n').trigger_load('nvim-dap')
            end
          '';
          keys = [
            {
              __unkeyed-1 = "<leader>du";
              __unkeyed-2 = "<cmd>lua require('dapui').toggle()<cr>";
              desc = "Toggle UI";
            }
            {
              __unkeyed-1 = "<leader>de";
              __unkeyed-2 = "<cmd>lua require('dapui').eval()<cr>";
              mode = [
                "n"
                "v"
              ];
              desc = "Evaluate Expression";
            }
          ];
          after = ''
            function()
              local dap = require('dap')
              local dapui = require('dapui')

              dapui.setup()

              dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
              end
              dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
              end
              dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
              end
            end
          '';
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
          before = ''
            function()
              require('lz.n').trigger_load('nvim-dap-virtual-text')
            end
          '';
          after = ''
            function()
              vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
              local icon = {
                Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
                Breakpoint          = " ",
                BreakpointCondition = " ",
                BreakpointRejected  = { " ", "DiagnosticError" },
                LogPoint            = ".>",
              }
              for name, sign in pairs(icon) do
                sign = type(sign) == "table" and sign or { sign }
                vim.fn.sign_define("Dap" .. name, {
                  text = sign[1],
                  texthl = sign[2] or "DiagnosticInfo",
                  linehl = sign[3],
                  numhl = sign[3]
                })
              end
            end
          '';
          keys = [
            {
              __unkeyed-1 = "<leader>d";
              __unkeyed-2 = "";
              desc = "+debug";
            }
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
            {
              __unkeyed-1 = "<leader>td";
              __unkeyed-2 = "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>";
              desc = "Debug Nearest";
            }
          ];
        };
      };
    };
  };
}
