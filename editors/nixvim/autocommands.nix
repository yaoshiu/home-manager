{ ... }:
{
  programs.nixvim = {
    autoCmd = [
      {
        callback.__raw = ''
          function()
            if vim.o.buftype ~= "nofile" then
              vim.cmd("checktime")
            end
          end
        '';
        desc = "Check file for changes on focus gain";
        event = [
          "FocusGained"
          "TermClose"
          "TermLeave"
        ];
      }
      {
        callback.__raw = ''
          function()
            (vim.hl or vim.highlight).on_yank()
          end
        '';
        desc = "Highlight yanked text";
        event = "TextYankPost";
      }
      {
        callback.__raw = ''
          function()
            local current = vim.fn.tabpagenr()
            vim.cmd("tabdo wincmd = ")
            vim.cmd("tabnext" .. current)
          end
        '';
        event = "VimResized";
        desc = "Equalize window sizes on resize";
      }
      {
        callback.__raw = ''
          function(event)
            local exclude = { "gitcommit" }
            local buf = event.buf
            if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc then
              return
            end
            vim.b[buf].last_loc = true
            local mark = vim.api.nvim_buf_get_mark(buf, '"')
            local lcount = vim.api.nvim_buf_line_count(buf)
            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
          end
        '';
        event = "BufReadPost";
        desc = "Jump to last known cursor position on buffer read";
      }
      {
        callback.__raw = ''
          function(event)
            vim.bo[event.buf].buflisted = false
            vim.schedule(function()
              vim.keymap.set("n", "q", function()
                vim.cmd("close")
                pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
              end, {
                buffer = event.buf,
                silent = true,
                desc = "Quit buffer"
              })
            end)
          end
        '';
        event = "FileType";
        pattern = [
          "PlenaryTestPopup"
          "checkhealth"
          "dbout"
          "gitsigns-blame"
          "grug-far"
          "help"
          "lspinfo"
          "neotest-output"
          "neotest-output-panel"
          "neotest-summary"
          "notify"
          "qf"
          "spectre_panel"
          "startuptime"
          "tsplayground"
        ];
        desc = "Close some filetypes with <q>";
      }
      {
        callback.__raw = ''
          function(event)
            vim.bo[event.buf].buflisted = false
          end
        '';
        event = "FileType";
        pattern = [ "man" ];
        desc = "Close man pages from buffer list";
      }
      {
        callback.__raw = ''
          function(event)
            if event.match:match("^%w%w+:[\\/][\\/]") then
              return
            end
            local file = vim.uv.fs_realpath(event.match) or event.match
            vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
          end
        '';
        event = "BufWritePre";
        desc = "Create parent directories on write";
      }
    ];
  };
}
