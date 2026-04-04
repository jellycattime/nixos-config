{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Dev
    vscode
    code-cursor
    python3
    go
    gopls
    rustc
    cargo
    nodejs_24

    # Media
    vlc
    telegram-desktop
    spotify
    yandex-music
    google-chrome

    # Games
    heroic
    steam
    transmission_4-qt

    # KDE themes
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