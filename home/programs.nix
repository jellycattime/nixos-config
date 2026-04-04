{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "max";
    userEmail = "maxim22ananin@gmail.com";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      k = "kubectl";
    };
  };
}