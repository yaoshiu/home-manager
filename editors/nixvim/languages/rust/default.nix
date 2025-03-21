{ ... }:
{
  programs.nixvim = {
    plugins = {
      crates = {
        enable = true;
        lazyLoad = {
          enable = true;
          settings.event = "BufLoad Cargo.toml";
        };

        settings = {
          completion.crates.enabled = true;
          lsp = {
            enabled = true;
            actions = true;
            completion = true;
            hover = true;
          };
        };
      };

      rustaceanvim = {
        enable = true;
        lazyLoad = {
          enable = true;
          settings.ft = "rust";
        };
      };
    };
  };
}
