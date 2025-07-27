# this file contains configuration for niri
{
  pkgs,
  /**
    pkgs-stable,
  */
  ...
}:
{
  #enable niri
  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = { };
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };
}
