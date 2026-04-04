{ config, pkgs, ... }:

{
  users.users.max = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };
}