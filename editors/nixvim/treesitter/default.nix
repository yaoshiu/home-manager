{ ... }: {
  imports = [
    ./ts-autotag
  ];

  programs.nixvim = {
    plugins.treesitter = {
      enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";

      settings = {
        highlight.enable = true;
        indent.enable = true;
        incremental_selection.enable = true;
      };
    };
  };
}
