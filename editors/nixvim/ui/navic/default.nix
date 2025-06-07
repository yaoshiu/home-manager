{ lib, ... }:
{
  programs.nixvim = {
    plugins = {
      navic = {
        enable = true;
        lazyLoad.settings = {
          event = "DeferredUIEnter";
        };
        settings = {
          separator = " ";
          icons = {
            File = " ";
            Module = " ";
            Namespace = " ";
            Package = " ";
            Class = " ";
            Method = " ";
            Property = " ";
            Field = " ";
            Constructor = " ";
            Enum = " ";
            Interface = " ";
            Function = " ";
            Variable = " ";
            Constant = " ";
            String = " ";
            Number = " ";
            Boolean = " ";
            Array = " ";
            Object = " ";
            Key = " ";
            Null = " ";
            EnumMember = " ";
            Struct = " ";
            Event = " ";
            Operator = " ";
            TypeParameter = " ";
          };
          highlight = true;
          depth_limit = 5;
          lazy_update_context = true;
          lsp.auto_attach = true;
        };
      };

      lualine = {
        lazyLoad.settings.before = ''
          function()
            require('lz.n').trigger_load('nvim-navic')
          end
        '';
        settings = {
          sections.lualine_c = lib.mkAfter [
            {
              __unkeyed-1 = "navic";
              color_correction = "dynamic";
            }
          ];
        };
      };
    };
  };
}
