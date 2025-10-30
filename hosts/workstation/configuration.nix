# this file contains config specific to my workstation
{
  config,
  pkgs,
  pkgs-stable,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../default/configuration.nix
    ../../modules/profiles/default.nix
    ../../modules/profiles/dev.nix
    ../../modules/profiles/home.nix
    ../../modules/profiles/gaming.nix
    ../../modules/m6lite.nix
    ../../environment/niri.nix
  ];
  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot.extraModulePackages = with config.boot.kernelPackages; [ ddcci-driver ];
  boot.kernelModules = [ "ddcci-backlight" ];
  services.udev.extraRules =
    let
      bash = "${pkgs.bash}/bin/bash";
      ddcciDev0 = "AMDGPU DM aux hw bus 1";
      ddcciNode0 = "/sys/bus/i2c/devices/i2c-10/new_device";
      ddcciDev1 = "AMDGPU DM aux hw bus 2";
      ddcciNode1 = "/sys/bus/i2c/devices/i2c-11/new_device";
    in
    ''
      SUBSYSTEM=="i2c", ACTION=="add", ATTR{name}=="${ddcciDev0}", RUN+="${bash} -c 'sleep 30; printf ddcci\ 0x37 > ${ddcciNode0}'"
      SUBSYSTEM=="i2c", ACTION=="add", ATTR{name}=="${ddcciDev1}", RUN+="${bash} -c 'sleep 30; printf ddcci\ 0x37 > ${ddcciNode1}'"
    '';

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
    packages = with pkgs-stable; [
      citrix_workspace
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "olm-3.2.16"
    "libxml2-2.13.8"
    "libsoup-2.74.3"
  ];

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
