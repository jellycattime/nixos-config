{ config, pkgs, ... }:

{
  imports = [
    ./programs.nix
  ];

  home.username = "max";
  home.homeDirectory = "/home/max";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}