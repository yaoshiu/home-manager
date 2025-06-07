{ ... }:
{
  programs.nixvim = {
    plugins.lualine = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      luaConfig.pre = ''
        vim.o.laststatus = vim.g.lualine_laststatus
      '';
      settings = {
        options = {
          theme = "auto";
          globalstatus.__raw = "vim.o.laststatus == 3";
          disabled_filetypes = {
            statusline = [
              "dashboard"
              "alpha"
              "ministarter"
              "snacks_dashboard"
            ];
          };
        };
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "branch" ];
          lualine_c = [
            {
              __unkeyed-1.__raw = ''
                function()
                  local icon = "󱉭 "
                  local root = Snacks.git.get_root()
                  local cwd = vim.uv.fs_realpath(vim.uv.cwd()) or ""
                  local name = vim.fs.basename(root)

                  return icon .. " " .. name
                end
              '';
              cond.__raw = ''
                function()
                  local root = Snacks.git.get_root()
                  local cwd = vim.uv.fs_realpath(vim.uv.cwd()) or ""

                  return root ~= cwd
                end
              '';
              color.__raw = ''
                function()
                  return { fg = Snacks.util.color("Special") }
                end
              '';
            }
            "diagnostics"
            {
              __unkeyed-1 = "filetype";
              icon_only = true;
              separator = "";
              padding = {
                left = 1;
                right = 0;
              };
            }
            {
              __raw = ''
                function(self)
                  local function format(component, text, hl_group)
                    text = text:gsub("%%", "%%%%")
                    if not hl_group or hl_group == "" then
                      return text
                    end
                    ---@type table<string, string>
                    component.hl_cache = component.hl_cache or {}
                    local lualine_hl_group = component.hl_cache[hl_group]
                    if not lualine_hl_group then
                      local utils = require("lualine.utils.utils")
                      ---@type string[]
                      local gui = vim.tbl_filter(function(x)
                        return x
                      end, {
                        utils.extract_highlight_colors(hl_group, "bold") and "bold",
                        utils.extract_highlight_colors(hl_group, "italic") and "italic",
                      })

                      lualine_hl_group = component:create_hl({
                        fg = utils.extract_highlight_colors(hl_group, "fg"),
                        gui = #gui > 0 and table.concat(gui, ",") or nil,
                      }, "LV_" .. hl_group) --[[@as string]]
                      component.hl_cache[hl_group] = lualine_hl_group
                    end
                    return component:format_hl(lualine_hl_group) .. text .. component:get_default_hl()
                  end

                  local path = vim.fn.expand("%:p") --[[@as string]]

                  if path == "" then
                    return ""
                  end

                  local root = Snacks.git.get_root()
                  local cwd = vim.uv.fs_realpath(vim.uv.cwd()) or ""

                  if path:find(cwd, 1, true) == 1 then
                    path = path:sub(#cwd + 2)
                  elseif path:find(root, 1, true) == 1 then
                    path = path:sub(#root + 2)
                  end

                  local sep = package.config:sub(1, 1)
                  local parts = vim.split(path, "[\\/]")

                  if #parts > 3 then
                    parts = { parts[1], "…", unpack(parts, #parts - 3 + 2, #parts) }
                  end

                  if vim.bo.modified then
                    parts[#parts] = format(self, parts[#parts], "MatchParen")
                  else
                    parts[#parts] = format(self, parts[#parts], "Bold")
                  end

                  local dir = ""
                  if #parts > 1 then
                    dir = table.concat({ unpack(parts, 1, #parts - 1) }, sep)
                    dir = format(self, dir .. sep, "")
                  end

                  local readonly = ""
                  if vim.bo.readonly then
                    readonly = format(self, " 󰌾 ", "MatchParen")
                  end
                  return dir .. parts[#parts] .. readonly
                end
              '';
            }
          ];
          lualine_x = [
            {
              __raw = ''
                Snacks.profiler.status()
              '';
            }
            {
              __unkeyed-1.__raw = ''
                function() return require("noice").api.status.command.get() end
              '';
              cond.__raw = ''
                function() return package.loaded["noice"] and require("noice").api.status.command.has() end
              '';
              color.__raw = ''
                function() return { fg = Snacks.util.color("Statement") } end
              '';
            }
            {
              __unkeyed-1.__raw = ''
                function() return "  " .. require("dap").status() end
              '';
              cond.__raw = ''
                function() return package.loaded["dap"] and require("dap").status() ~= "" end
              '';
              color.__raw = ''
                function() return { fg = Snacks.util.color("Debug") } end
              '';
            }
            {
              __unkeyed-1 = "diff";
              source.__raw = ''
                function()
                  local gitsigns = vim.b.gitsigns_status_dict
                  if gitsigns then
                    return {
                      added = gitsigns.added,
                      modified = gitsigns.changed,
                      removed = gitsigns.removed,
                    }
                  end
                end
              '';
            }
          ];

          lualine_y = [
            {
              __unkeyed-1 = "progress";
              separator = " ";
              padding = {
                left = 1;
                right = 0;
              };
            }
            {
              __unkeyed-1 = "location";
              padding = {
                left = 0;
                right = 1;
              };
            }
          ];

          lualine_z = [
            {
              __raw = ''
                function()
                  return " " .. os.date("%R")
                end
              '';
            }
          ];
        };
      };
    };
  };
}
