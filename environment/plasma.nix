# this file contains configuration for plasma 6
{ pkgs, ... }:
{
  imports = [
    ./sddm.nix
  ];
  # Enable the KDE Plasma Desktop Environment.
  services.desktopManager.plasma6.enable = true;
  environment.systemPackages = with pkgs; [
    kdePackages.isoimagewriter
    kdePackages.plasma-disks
    kdePackages.kdeplasma-addons
    kdePackages.plasma-firewall
    nur.repos.shadowrz.klassy-qt6
    catppuccin-kde
    (catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "mauve" ];
      winDecStyles = [ "classic" ];
    })
  ];
}
