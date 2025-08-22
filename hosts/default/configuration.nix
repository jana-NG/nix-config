# this file contains universal hardware config
{ pkgs, lib, ... }:
{

  imports = [
    ./boot.nix
  ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable networking
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = lib.mkDefault false;
    };
  };

  #Open all non-well-known ports (i like my software to actually work)
  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      {
        from = 1025;
        to = 65535;
      }
    ];
    allowedUDPPortRanges = [
      {
        from = 1025;
        to = 65535;
      }
    ];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "de_se_fi";
  };

  #Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # replace sudo with sudo-rs
  security.sudo-rs.enable = true;

  # enable zsh for users
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.dconf.enable = true;

  boot.loader.systemd-boot.configurationLimit = 4;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 4d";
  };
  nix.settings.auto-optimise-store = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # SMART monitoring
  services.smartd = {
    enable = true;
  };

  # dbus
  services.dbus = {
    enable = true;
    implementation = "broker";
  };
}
