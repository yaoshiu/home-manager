{ pkgs, ... }:
{
  home.packages = [
    (pkgs.ansible.override { extraPackages = ps: with ps; [ pyotp ]; })
  ];
}
