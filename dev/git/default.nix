{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Fay Ash";
    userEmail = "yaoshiu@qq.com";
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
}
