{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    arc-kde-theme
    adapta-kde-theme
    twilight-kde
    qogir-kde
    sweet-nova
    kdePackages.breeze-plymouth
    kdePackages.koi
    kdePackages.plasma-integration
    kdePackages.plasma-workspace-wallpapers
  ];
}