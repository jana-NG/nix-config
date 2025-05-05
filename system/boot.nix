# this file contains boot configuration
{ lib, pkgs, ... }:
{
  # Bootloader.
  boot.kernelParams = [
    "quiet"
    "splash"
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;
}
