# this file contains misc service configuration
{ ... }:
{

  # Enable flatpaks
  services.flatpak.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;
  # SMART monitoring
  services.smartd = {
    enable = true;
  };
  services.dbus.enable = true;

}
