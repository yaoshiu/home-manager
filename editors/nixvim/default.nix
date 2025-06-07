{ pkgs, ... }:
{
  imports = [
    ./coding
    ./dap
    ./editor
    ./formatting
    ./languages
    ./linting
    ./lsp
    ./test
    ./treesitter
    ./ui
    ./util
    ./mini.nix
    ./keymaps.nix
    ./autocommands.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorschemes.tokyonight = {
      enable = true;
      lazyLoad.enable = true;
    };

    clipboard = {
      providers.wl-copy.enable = true;
    };

    globals = {
      mapleader = " ";
      maplocalleader = "\\";
    };

    opts = {
      autowrite = true;
      completeopt = "menu,menuone,noselect";
      conceallevel = 2;
      confirm = true;
      cursorline = true;
      expandtab = true;
      fillchars = {
        foldopen = "";
        foldclose = "";
        fold = " ";
        foldsep = " ";
        diff = "╱";
        eob = " ";
      };
      foldlevel = 99;
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
      inccommand = "nosplit";
      jumpoptions = "view";
      laststatus = 3;
      linebreak = true;
      list = true;
      pumblend = 10;
      pumheight = 10;
      number = true;
      ruler = false;
      scrolloff = 4;
      sessionoptions = [
        "buffers"
        "curdir"
        "tabpages"
        "winsize"
        "help"
        "globals"
        "skiprtp"
        "folds"
      ];
      shiftround = true;
      shiftwidth = 2;
      shortmess.__raw = ''
        vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
      '';
      showmode = false;
      smartcase = true;
      smartindent = true;
      spelllang = [ "en" ];
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      statuscolumn.__raw = "[[%!v:lua.require'snacks.statuscolumn'.get()]]";
      tabstop = 2;
      termguicolors = true;
      timeoutlen.__raw = ''
        vim.g.vscode and 1000 or 300
      '';
      undofile = true;
      undolevels = 10000;
      updatetime = 200;
      virtualedit = "block";
      wildmode = "longest:full,full";
      winminwidth = 5;
      wrap = false;

      smoothscroll = true;
      relativenumber = true;
      signcolumn = "yes";
      exrc = true;
    };

    plugins = {
      lz-n = {
        enable = true;
      };
    };

    extraConfigLua = ''
      function try_require(module)
        local ok, result = pcall(require, module)
        if ok then
          return result
        else
          return nil
        end
      end
    '';
  };
}
