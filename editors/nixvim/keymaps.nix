{ ... }:
{
  programs.nixvim = {
    keymaps = [
      {
        action = "v:count == 0 ? 'gj' : 'j'";
        key = "j";
        mode = [
          "n"
          "x"
        ];
        options = {
          expr = true;
          silent = true;
          desc = "Down";
        };
      }
      {
        action = "v:count == 0 ? 'gj' : 'j'";
        key = "<down>";
        mode = [
          "n"
          "x"
        ];
        options = {
          expr = true;
          silent = true;
          desc = "Down";
        };
      }
      {
        action = "v:count == 0 ? 'gk' : 'k'";
        key = "k";
        mode = [
          "n"
          "x"
        ];
        options = {
          expr = true;
          silent = true;
          desc = "Up";
        };
      }
      {
        action = "v:count == 0 ? 'gk' : 'k'";
        key = "<up>";
        mode = [
          "n"
          "x"
        ];
        options = {
          expr = true;
          silent = true;
          desc = "Up";
        };
      }
      {
        action = "<c-w>h";
        key = "<c-h>";
        options = {
          remap = true;
          desc = "Go to Left Window";
        };
      }
      {
        action = "<c-w>j";
        key = "<c-j>";
        options = {
          remap = true;
          desc = "Go to Lower Window";
        };
      }
      {
        action = "<c-w>k";
        key = "<c-k>";
        options = {
          remap = true;
          desc = "Go to Upper Window";
        };
      }
      {
        action = "<c-w>l";
        key = "<c-l>";
        options = {
          remap = true;
          desc = "Go to Right Window";
        };
      }
      {
        action = "<cmd>resize +2<cr>";
        key = "<c-up>";
        options.desc = "Increase Window Height";
      }
      {
        action = "<cmd>resize -2<cr>";
        key = "<c-down>";
        options.desc = "Decrease Window Height";
      }
      {
        action = "<cmd>vertical resize -2<cr>";
        key = "<c-left>";
        options.desc = "Decrease Window Width";
      }
      {
        action = "<cmd>vertical resize +2<cr>";
        key = "<c-right>";
        options.desc = "Increase Window Width";
      }
      {
        action = "<cmd>execute 'move .+' . v:count1<cr>==";
        key = "<a-j>";
        options.desc = "Move Down";
      }
      {
        action = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==";
        key = "<a-k>";
        options.desc = "Move Up";
      }
      {
        action = "<esc><cmd>m .+1<cr>==gi";
        key = "<a-j>";
        options.desc = "Move Down";
      }
      {
        action = "<esc><cmd>m .-2<cr>==gi";
        key = "<a-k>";
        options.desc = "Move Up";
      }
      {
        action = "<cmd><c-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv";
        key = "<a-j>";
        options.desc = "Move Down";
      }
      {
        action = "<cmd><c-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv";
        key = "<a-k>";
        options.desc = "Move Up";
      }
      {
        action = "<cmd>bprevious<cr>";
        key = "<s-h>";
        options.desc = "Prev Buffer";
      }
      {
        action = "<cmd>bnext<cr>";
        key = "<s-l>";
        options.desc = "Next Buffer";
      }
      {
        action = {
          __raw = ''
            function()
              vim.cmd("noh")
              return "<esc>"
            end
          '';
        };
        key = "<esc>";
        options = {
          expr = true;
          desc = "Escape and Clear hlsearch";
        };
      }
      {
        action = "<cmd>nohlsearch<bar>diffupdate<bar>normal! <c-l><cr>";
        key = "<leader>ur";
        options.desc = "Redraw / Clear hlsearch / Diff Update";
      }
      {
        action = "'Nn'[v:searchforward].'zv'";
        key = "n";
        options = {
          expr = true;
          desc = "Next Search Result";
        };
      }
      {
        action = "'Nn'[v:searchforward]";
        key = "n";
        mode = [
          "x"
          "o"
        ];
        options = {
          expr = true;
          desc = "Next Search Result";
        };
      }
      {
        action = "'nN'[v:searchforward].'zv'";
        key = "N";
        options = {
          expr = true;
          desc = "Prev Search Result";
        };
      }
      {
        action = "'nN'[v:searchforward]";
        key = "N";
        mode = [
          "x"
          "o"
        ];
        options = {
          expr = true;
          desc = "Prev Search Result";
        };
      }
      {
        action = ",<c-g>u";
        key = ",";
        mode = [ "i" ];
      }
      {
        action = ".<c-g>u";
        key = ".";
        mode = [ "i" ];
      }
      {
        action = ";<c-g>u";
        key = ";";
        mode = [ "i" ];
      }
      {
        action = "<gv";
        key = "<";
        mode = [ "v" ];
      }
      {
        action = ">gv";
        key = ">";
        mode = [ "v" ];
      }
    ];
  };
}
