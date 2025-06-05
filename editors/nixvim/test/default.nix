{ ... }:
{
  programs.nixvim = {
    plugins = {
      neotest = {
        enable = true;
        settings = {
          status = {
            virtual_text = true;
          };
        };
        lazyLoad.settings = {
          keys = [
            {
              __unkeyed-1 = "<leader>t";
              __unkeyed-2 = "";
              desc = "+test";
            }
            {
              __unkeyed-1 = "<leader>tt";
              __unkeyed-2 = "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>";
              desc = "Run File (Neotest)";
            }
            {
              __unkeyed-1 = "<leader>tT";
              __unkeyed-2 = "<cmd>lua require('neotest').run.run(vim.uv.cwd())<cr>";
              desc = "Run All Test Files (Neotest)";
            }
            {
              __unkeyed-1 = "<leader>tr";
              __unkeyed-2 = "<cmd>lua require('neotest').run.run()<cr>";
              desc = "Run Nearest (Neotest)";
            }
            {
              __unkeyed-1 = "<leader>tl";
              __unkeyed-2 = "<cmd>lua require('neotest').run.run_last()<cr>";
              desc = "Run Last (Neotest)";
            }
            {
              __unkeyed-1 = "<leader>ts";
              __unkeyed-2 = "<cmd>lua require('neotest').summary.toggle()<cr>";
              desc = "Toggle Summary (Neotest)";
            }
            {
              __unkeyed-1 = "<leader>to";
              __unkeyed-2 = "<cmd>lua require('neotest').output.open({ enter = true, auto_close = true })<cr>";
              desc = "Show Output (Neotest)";
            }
            {
              __unkeyed-1 = "<leader>tO";
              __unkeyed-2 = "<cmd>lua require('neotest').output_panel.toggle()<cr>";
              desc = "Toggle Output Panel (Neotest)";
            }
            {
              __unkeyed-1 = "<leader>tS";
              __unkeyed-2 = "<cmd>lua require('neotest').run.stop()<cr>";
              desc = "Stop (Neotest)";
            }
            {
              __unkeyed-1 = "<leader>tw";
              __unkeyed-2 = "<cmd>lua require('neotest').watch.toggle(vim.fn.expand('%'))<cr>";
              desc = "Toggle Watch (Neotest)";
            }
          ];
        };
      };
    };
  };
}
