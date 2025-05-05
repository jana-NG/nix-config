# this file contains basic programs i use
{ lib, pkgs, ... }:
{
  # Install firefox.
  programs.firefox.enable = true;

  programs.dconf.enable = true;

  #XDG Portals
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  #Add Fonts
  fonts.fontDir.enable = true;

  fonts.packages = with pkgs; [
    ibm-plex
    inter
    jetbrains-mono
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nil
    nixfmt-rfc-style
    home-manager
    drawio
    haruna
    btop
    nvtopPackages.full
    xsettingsd
    pciutils
    fastfetch
    xorg.xrdb
    xorg.xeyes
    ffmpeg-full
  ];
}
