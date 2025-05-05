# this file contains universal hardware config
{ lib, pkgs, ... }:
{

  # Enable networking
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
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
