{ ... }: {
  programs.bash = {
    enable = true;
    profileExtra = ''
      . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh 
    '';
  };
}
