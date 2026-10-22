{ pkgs, ... }: {
  home.packages = [
    (pkgs.writeShellApplication {
      name = "clip";

      text = ''
        payload=$(base64 | tr -d '\r\n')
        printf '\033];52;c;%s\a' "$payload" > /dev/tty
      '';
    })
  ];
}
