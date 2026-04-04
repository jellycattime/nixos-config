{ config, pkgs, ... }:

{
  imports = [
    ./programs.nix
  ];

  home.username = "max";
  home.homeDirectory = "/home/max";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}