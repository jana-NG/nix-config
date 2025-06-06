# this file contains config specific to my thinkpad a485
{ lib, pkgs, ... }:
{
  boot.kernelParams = [
    "acpi_backlight=native"
  ];
  networking.hostName = "nikkix13g1"; # Define your hostname.

  # Power Management
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = true;

  # Firmware updates
  hardware.enableRedistributableFirmware = true;
  services.fwupd.enable = true;

  environment.systemPackages = with pkgs; [
    ryzenadj
  ];
}
