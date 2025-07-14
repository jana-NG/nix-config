# this file contains configuration for niri
{ pkgs, pkgs-stable, ... }:
{
  #enable niri
  programs.niri.enable = true;
  #more desktop stuff
  programs.waybar.enable = true;
  environment.systemPackages = with pkgs; [
    fuzzel
    mako
    alacritty
    swaybg
    swayidle
    swaylock
    xwayland-satellite
  ];
  #enable portals
  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
  };
}
