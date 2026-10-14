{ pkgs, lib, ... }:
{
  imports = [
    ./age
    ./nix
    ./ansible
    ./bottom
    ./xh
    ./bat
    ./direnv
    ./eza
    ./fd
    ./fzf
    ./git
    ./just
    ./lazygit
    ./mosh
    ./ripgrep
    ./starship
    ./tealdeer
    ./zoxide
  ] ++ lib.optional pkgs.stdenv.isDarwin ./container;
}
