{ ... }: {
  programs.nixvim = {
    plugins.todo-comments = {
    enable = true;
      lazyLoad.settings.event = "DeferredUIEnter";
  };
  };
}
