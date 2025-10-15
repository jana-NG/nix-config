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
  boot.kernelParams = [
    "acpi_backlight=native"
  ];
  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
    HandleLidSwitch = "suspend";
  };
  systemd.sleep.extraConfig = ''
    HibernateMode=shutdown
    SuspendState=mem
    MemorySleepMode=s2idle
  '';
  networking.hostName = "nikkix13g1"; # Define your hostname.

  # Power Management
  powerManagement.enable = true;
  services.power-profiles-daemon.enable = false;
  powerManagement.cpuFreqGovernor = "schedutil";
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        turbo = "never";
        platform_profile = "low-power";
        enable_thresholds = true;
        start_threshold = 80;
        stop_threshold = 90;
      };
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
  # services.fprintd.enable = true;

  environment.systemPackages = with pkgs; [
    ryzenadj
    powertop
    auto-cpufreq
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
