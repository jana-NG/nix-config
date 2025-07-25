# this file contains config specific to my thinkpad x13 gen 1 (amd)
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

  boot.kernelParams = [
    "acpi_backlight=native"
    "mem_sleep_default=deep"
  ];
  networking.hostName = "nikkix13g1"; # Define your hostname.

  # Power Management
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = false;
  powerManagement.cpuFreqGovernor = "schedutil";
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      #Optional helps save long term battery health
      START_CHARGE_THRESH_BAT0 = 84; # 84 and below it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 90; # 90 and above it stops charging

    };
  };

  # block bluetooth to prevent it disappearing
  powerManagement.powerDownCommands = ''
    echo "Pre-Sleep Bluetooth block"
    ${pkgs.util-linux}/bin/rfkill block bluetooth
  '';

  # unblock bluetooth
  powerManagement.resumeCommands = ''
    sleep 5
    echo "Post-Resume Bluetooth unblock."
    ${pkgs.util-linux}/bin/rfkill unblock bluetooth
  '';

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
