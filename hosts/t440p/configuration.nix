# this file contains config specific to my thinkpad x13 gen 1 (amd)
{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../default/configuration.nix
    ../../modules/profiles/default.nix
    ../../modules/profiles/dev.nix
    ../../modules/profiles/home.nix
    ../../modules/profiles/gaming.nix
    ../../environment/niri.nix
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  boot = {
    extraModprobeConfig = ''
      options bbswitch use_acpi_to_detect_card_state=1
      options thinkpad_acpi force_load=1 fan_control=1
    '';
    # TODO: probably enable tcsd? Is this line necessary?
    kernelModules = [ "tpm-rng" ];
  };
  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandleLidSwitch = "suspend";
  };

  networking.hostName = "nikkit440p"; # Define your hostname.

  # Power Management
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = true;

  # Firmware updates
  hardware.enableRedistributableFirmware = true;
  services.fwupd.enable = true;

  #Fingerprint sensor
  # services.fprintd.enable = true;

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
  services.flatpak.packages = [

  ];

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
