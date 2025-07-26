# this file contains config specific to my workstation
{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../default/configuration.nix
    ../../packages/default.nix
    ../../packages/dev.nix
    ../../packages/home.nix
    ../../system/boot.nix
    ../../system/services.nix
    ../../environment/plasma.nix
  ];

  #boot.kernelParams = [
  #];
  networking.hostName = "nikkiworkstation"; # Define your hostname.

  # Power Management
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = true;

  # Firmware updates
  hardware.enableRedistributableFirmware = true;
  services.fwupd.enable = true;

  #environment.systemPackages = with pkgs; [
  #];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nikki = {
    isNormalUser = true;
    description = "nikki";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    #packages = with pkgs; [
    #];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
