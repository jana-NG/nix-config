# this file contains configuration for plasma 6
{ pkgs, ... }:
{
  # Configure SDDM
  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-mocha";
  };
  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;
  programs.kdeconnect.enable = true;
  services.dbus.enable = true;
  environment.systemPackages = with pkgs; [
    kdePackages.isoimagewriter
    kdePackages.marknote
    kdePackages.plasma-disks
    kdePackages.kclock
    kdePackages.powerdevil
    kdePackages.kdeplasma-addons
    kdePackages.kate
    kdePackages.neochat
    kdePackages.plasma-firewall
    kdePackages.kweather
    kdePackages.kalk
    nur.repos.shadowrz.klassy-qt6
    catppuccin-kde
    catppuccin-sddm
    (catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "mauve" ];
      winDecStyles = [ "classic" ];
    })
    (catppuccin-sddm.override {
      flavor = "mocha";
      font = "IBM Plex Sans";
      fontSize = "11";
    })
  ];
}
