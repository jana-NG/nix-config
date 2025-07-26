# this file contains universal hardware config
{ lib, pkgs-stable, ... }:
{

  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./docker/docker.nix
    ./services/homepage.nix
    ./services/jellyfin.nix
    ./services/file-browser.nix
    ./services/home-assistant.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Set your time zone.
  time.timeZone = "Europe/Berlin";
  networking.hostName = "tcenter";
  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "tcenterdrive"
    ];
    packages = with pkgs-stable; [ git ];
  };

  services.smartd = {
    enable = true;
  };

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

  # Install firefox.
  security.sudo-rs.enable = true;
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      uppies = "nix flake update --flake path:/etc/nixos && sudo nixos-rebuild switch --flake path:/etc/nixos --upgrade";
      nrs = "sudo git -C /etc/nixos pull && sudo nixos-rebuild switch --flake path:/etc/nixos";
    };
  };
  users.defaultUserShell = pkgs-stable.zsh;
  boot.loader.systemd-boot.configurationLimit = 4;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nix.settings.auto-optimise-store = true;

  # Enable networking
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = true;
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.fail2ban = {
    enable = true;
    # Ban IP after 5 failures
    maxretry = 5;
    ignoreIP = [
      # Whitelist some subnets
      "10.0.0.0/8"
      "172.16.0.0/12"
      "192.168.0.0/16"
    ];
    bantime = "24h"; # Ban IPs for one day on the first ban
    bantime-increment = {
      enable = true; # Enable increment of bantime after each violation
      multipliers = "1 2 4 8 16 32 64";
      maxtime = "168h"; # Do not ban for more than 1 week
      overalljails = true; # Calculate the bantime based on all the violations
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs-stable; [
      intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
      libva-vdpau-driver # Previously vaapiVdpau
      intel-compute-runtime-legacy1
      intel-media-sdk # QSV up to 11th gen
      intel-ocl # OpenCL support
    ];
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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    22
    80
    443
    8080
    8081
    8123
    61208
  ];
  networking.firewall.allowedUDPPorts = [ ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
