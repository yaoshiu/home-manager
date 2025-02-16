{ ... }:
{
  programs.nixvim = {
    plugins.overseer = {
      lazyLoad = {
        enable = true;
        settings = {
          cmd = [
            "OverseerOpen"
            "OverseerClose"
            "OverseerToggle"
            "OverseerSaveBundle"
            "OverseerLoadBundle"
            "OverseerDeleteBundle"
            "OverseerRunCmd"
            "OverseerRun"
            "OverseerInfo"
            "OverseerBuild"
            "OverseerQuickAction"
            "OverseerTaskAction"
            "OverseerClearCache"
          ];
          keys = [
            {
              __unkeyed-1 = "<leader>ow";
              __unkeyed-2 = "<cmd>OverseerToggle<cr>";
              desc = "Task List";
            }
            {
              __unkeyed-1 = "<leader>oo";
              __unkeyed-2 = "<cmd>OverseerRun<cr>";
              desc = "Run Task";
            }
          ];
        };
      };

      enable = true;
    };
  };
}
