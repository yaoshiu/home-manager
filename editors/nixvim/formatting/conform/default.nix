{ ... }: {
  programs.nixvim = {
    plugins.conform-nvim = {
    enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
      settings = {
        format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
      };
  };
  };
}
