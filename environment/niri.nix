# this file contains configuration for niri
{
  pkgs,
  inputs,
  /**
    pkgs-stable,
  */
  ...
}:
{
  #enable niri
  programs.niri.enable = true;
  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = { };
  hardware.i2c.enable = true;
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    inputs.quickshell.packages.${pkgs.system}.default
    cava
    cliphist
    matugen
    wl-clipboard
    ddcutil
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };
}
