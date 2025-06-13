# this file contains config specific to my thinkpad a485
{ pkgs, ... }:
{
  imports = [
    ../hardware-configuration.nix
    ../packages/default.nix
    ../packages/dev.nix
    ../packages/home.nix
    ../system/boot.nix
    ../system/services.nix
    ../hardware/default.nix
    ../environment/plasma.nix
    ../environment/cosmic.nix
  ];

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

  #Fingerprint sensor
  services.fprintd.enable = true;

  environment.systemPackages = with pkgs; [
    ryzenadj
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
  system.stateVersion = "24.11"; # Did you read the comment?

}
