{ ... }: {
  imports = [
    ./ghostty
  ];

  targets.darwin = {
    linkApps.enable = false;
    copyApps.enable = true;
  };
}
