# modules/kde-themes.nix
{ config, pkgs, nixpkgs-unstable, ... }:
let
  unstable = import nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  environment.systemPackages = with pkgs; [
    kdePackages.kalk
    arc-kde-theme
    adapta-kde-theme
    aritim-dark
    twilight-kde
    qogir-kde
    pitch-black
    sweet-nova
    catppuccin-kde
    colorfuldarkglobal6-kde
    whitesur-kde
    utterly-nord-plasma
    utterly-round-plasma-style
    nordic
    kdePackages.breeze-plymouth
    kdePackages.plasma-integration
    kdePackages.plasma-workspace-wallpapers
    klassy
    # Kvantum
    kdePackages.qtstyleplugin-kvantum
    catppuccin-kvantum
    gruvbox-kvantum
    unstable.materia-everforest-kvantum

  ];
}