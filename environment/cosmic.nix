# this file contains configuration for the cosmic desktop
{ pkgs, ... }:
{
  # Enable Cosmic Greeter
  # services.displayManager.cosmic-greeter.enable = true;
  # Enable Cosmic
  services.desktopManager.cosmic.enable = true;
  services.dbus.enable = true;
  environment.sessionVariables.COSMIC_DATA_CONTROL_ENABLED = 1;
  systemd.packages = [ pkgs.observatory ];
  systemd.services.monitord.wantedBy = [ "multi-user.target" ];
  environment.systemPackages = with pkgs; [
    tasks
  ];
}
