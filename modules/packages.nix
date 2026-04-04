{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
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
  ];

  programs.firefox.enable = true;
}