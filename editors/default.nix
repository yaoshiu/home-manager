{ ... }:
{
  imports = [
    ./helix
    ./neovim
  ];

  programs.neovim.defaultEditor = true;
}
