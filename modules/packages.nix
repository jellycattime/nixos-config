{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ nss nspr ];

  services.flatpak.enable = true;
  xdg.portal.enable = true;

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
    terragrunt
    kubectl
    kind
    jetbrains.pycharm-oss

    # Development
    vscode
    code-cursor
    python3
    go
    gopls
    rustc
    cargo
    nodejs_24
    electron_40

    # Apps
    vlc
    telegram-desktop
    spotify
    yandex-music
    google-chrome
    heroic
    steam
    steam-run
    transmission_4-qt
    discord
    flatpak
  ];
}