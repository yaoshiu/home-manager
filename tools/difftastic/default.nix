{ ... }: {
  programs.difftastic = {
    enable = true;
    git.enable = true;
  };

  programs.lazygit.settings = {
    git.diffRenderers = [
      {
        type = "extDiff";
        command = "difft --color=always --background={{colorScheme}} --context={{diffContext}}";
      }
    ];
  };
}
