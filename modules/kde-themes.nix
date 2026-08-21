# modules/kde-themes.nix
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.kalk
#    arc-kde-theme
#    adapta-kde-theme
#    twilight-kde
#    qogir-kde
#    sweet-nova
    kdePackages.breeze-plymouth
    kdePackages.plasma-integration
    kdePackages.plasma-workspace-wallpapers
  ];
}