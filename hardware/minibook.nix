# this file contains config specific to my chuwi minibook x
{ pkgs, ... }:
{
  imports = [
    minibook/hardware-configuration.nix
    ../packages/default.nix
    ../packages/dev.nix
    ../packages/home.nix
    ../system/boot.nix
    ../system/services.nix
    ../hardware/default.nix
    ../environment/plasma.nix
    #../environment/cosmic.nix
    #../environment/niri.nix
  ];

  boot.kernelParams = [
    "fbcon=rotate:1"
  ];
  networking.hostName = "nikkiminibook"; # Define your hostname.

  # Power Management
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = true;
  environment.systemPackages = with pkgs; [
    powertop
  ];

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
