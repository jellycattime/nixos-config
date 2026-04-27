{ config, pkgs, ... }:

{
  users.users.max = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];

    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}