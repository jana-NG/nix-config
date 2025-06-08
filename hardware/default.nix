# this file contains universal hardware config
{ lib, pkgs, ... }:
{

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
      wifi.powersave = false;
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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
