# modules/kde-themes.nix
{ config, pkgs, nixpkgs-unstable, ... }:
let
  unstable = import nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  # Нужно, чтобы Qt5-приложения подхватывали тему Plasma 6
  services.desktopManager.plasma6.enableQt5Integration = true;

  environment.systemPackages = with pkgs; [
    # ---------- KDE ----------
    kdePackages.breeze
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
    kdePackages.ocean-sound-theme
    kdePackages.plasma-integration
    kdePackages.plasma-workspace-wallpapers
    kdePackages.breeze-plymouth
    kdePackages.kalk

    # ---------- Plasma 6 ----------
    klassy
    colorfuldarkglobal6-kde     # Colorful-Dark-Global-6
    utterly-nord-plasma
    utterly-round-plasma-style  # desktoptheme + aurorae

    # ---------- Plasma 5 ----------
    qogir-kde
    whitesur-kde
    twilight-kde
    catppuccin-kde
    nordic
    sweet-nova
    aritim-dark
    dracula-theme
    kde-gruvbox
    plasma-overdose-kde-theme
    cyberpunk-neon.kde
    pitch-black

    # ---------- Kvantum ----------
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    catppuccin-kvantum
    gruvbox-kvantum
    rose-pine-kvantum
    kvmarwaita
    unstable.materia-everforest-kvantum

    kde-rounded-corners
    kdePackages.applet-window-buttons6
    kdePackages.krohnkite
    kdePackages.karousel
    kdePackages.kzones

    papirus-icon-theme
    papirus-folders
    tela-icon-theme
    tela-circle-icon-theme
    qogir-icon-theme
    whitesur-icon-theme
    colloid-icon-theme
    arc-icon-theme
    numix-icon-theme
    candy-icons
    marwaita-icons
    dracula-icon-theme
    gruvbox-plus-icons
    rose-pine-icon-theme
    nordzy-icon-theme
    vimix-icon-theme

    bibata-cursors
    breeze-hacked-cursor-theme
    capitaine-cursors
    catppuccin-cursors
    everforest-cursors
    graphite-cursors
    layan-cursors
    material-cursors
    nordzy-cursor-theme
    numix-cursor-theme
    rose-pine-cursor
    vimix-cursors
    whitesur-cursors

    # ---------- Themes SDDM (Qt6) ----------
    sddm-astronaut
    catppuccin-sddm
    catppuccin-sddm-corners
    where-is-my-sddm-theme
    elegant-sddm
  ];

  # SDDM /run/current-system/sw/share/sddm/themes
  services.displayManager.sddm.extraPackages = with pkgs; [
    kdePackages.plasma-desktop
    kdePackages.qtsvg
    kdePackages.qtmultimedia
    kdePackages.qtvirtualkeyboard
  ];
}