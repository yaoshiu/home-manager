{ ... }:
{
  programs.nixvim = {
    plugins.mini.modules = {
      ai = {
        n_lines = 500;
        custom_textobjects = {
          o.__raw = ''
            require("mini.ai").gen_spec.treesitter({
              a = { "@block.outer", "@conditional.outer", "@loop.outer" },
              i = { "@block.inner", "@conditional.inner", "@loop.inner" },
            })
          '';
          f.__raw = ''
            require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" })
          '';
          c.__raw = ''
            require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" })
          '';
          t = [
            "<([%p%w]-)%f[^<%w][^<>]->.-</%1>"
            "^<.->().*()</[^/]->$"
          ];
          d = [
            "%f[%d]%d+"
          ];
          e = [
            [
              "%u[%l%d]+%f[^%l%d]"
              "%f[%S][%l%d]+%f[^%l%d]"
              "%f[%P][%l%d]+%f[^%l%d]"
              "^[%l%d]+%f[^%l%d]"
            ]
            "^().*()$"
          ];
          u.__raw = ''
            require("mini.ai").gen_spec.function_call()
          '';
          U.__raw = ''
            require("mini.ai").gen_spec.function_call({ name_pattern = "[%w_]" })
          '';
        };
      };
    };
  };
}
