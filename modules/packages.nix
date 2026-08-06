# modules/packages.nix
{ config, pkgs, nixpkgs-unstable, ... }:

let
  unstable = import nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in

{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ 
    stdenv.cc.cc
    zlib
    openssl

    # Glib / GObject (electron)
    glib
    glibc
    libgbm

    # GTK / GUI
    gtk3
    gtk4
    gdk-pixbuf
    pango
    cairo
    atk
    at-spi2-atk
    at-spi2-core
    harfbuzz

    # X11 / Wayland
    xorg.libX11
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXrandr
    xorg.libXrender
    xorg.libxcb
    xorg.libXcursor
    xorg.libXi
    libxkbcommon
    wayland

    # Graphics
    libdrm
    mesa
    libGL
    vulkan-loader

    # Audio
    alsa-lib
    libpulseaudio

    # System
    dbus
    cups
    expat
    nspr
    nss
    udev

    # Python native extensions
    libffi
    bzip2
    readline
    sqlite
  ];

  services.flatpak.enable = true;
  xdg.portal.enable = true;

  environment.systemPackages = with pkgs; [
    # System tools
    neovim
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
    jetbrains.pycharm

    # Development
    vscode
    unstable.code-cursor
    python3
    python3Packages.pip
    python3Packages.virtualenv
    # Inside the project
    # python -m venv .venv
    # source .venv/bin/activate
    # pip install whatever
    go
    gopls
    rustc
    cargo
    nodejs_24
    electron_43

    # Apps
    ffmpeg
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
    krita
    unrar
    audacity
    onlyoffice-desktopeditors
    inkscape
    shotcut
    kid3
  ];
}