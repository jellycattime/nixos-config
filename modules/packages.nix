{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    # System tools
    vim
    wget
    git
    htop
    fastfetch

    # DevOps
    ansible
    terraform
    kubectl
    docker-compose
    kind

    # Development
    vscode
    code-cursor
    python3
    go
    gopls
    rustc
    cargo
    nodejs_24

    # Apps
    vlc
    telegram-desktop
    spotify
    yandex-music
    google-chrome
    heroic
    steam
    transmission_4-qt
  ];
}