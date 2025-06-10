{ config, ... }:
let
  helpers = config.lib.nixvim;
in
{
  programs.nixvim = {
    plugins = {
      neotest = {
        enable = true;
        settings = {
          status = {
            virtual_text = true;
          };
          output = {
            open_on_run = true;
          };
          quickfix = {
            open.__raw = ''
              function()
                require("trouble").open({ mode = "quickfix", focus = false })
              end
            '';
          };
        };
        lazyLoad.settings = {
          after.__raw = ''
            function()
              local opts = ${helpers.lua.toLuaObject config.programs.nixvim.plugins.neotest.settings}
              vim.diagnostic.config({
                virtual_text = {
                  format = function(diagnostic)
                    -- Replace newline and tab characters with space for more compact diagnostics
                    local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                    return message
                  end,
                },
              }, neotest_ns)

              opts.consumers = opts.consumers or {}
              -- Refresh and auto close trouble after running tests
              ---@type neotest.Consumer
              opts.consumers.trouble = function(client)
                client.listeners.results = function(adapter_id, results, partial)
                  if partial then
                    return
                  end
                  local tree = assert(client:get_position(nil, { adapter = adapter_id }))

                  local failed = 0
                  for pos_id, result in pairs(results) do
                    if result.status == "failed" and tree:get_key(pos_id) then
                      failed = failed + 1
                    end
                  end
                  vim.schedule(function()
                    local trouble = require("trouble")
                    if trouble.is_open() then
                      trouble.refresh()
                      if failed == 0 then
                        trouble.close()
                      end
                    end
                  end)
                  return {}
                end
              end

              require("neotest").setup(opts)
            end
          '';
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
