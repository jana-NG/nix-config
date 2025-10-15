# this file contains configuration for niri
{
  pkgs,
  inputs,
  lib,
  /**
    pkgs-stable,
  */
  ...
}:
{
  #enable niri
  programs.niri.enable = true;
  #user picture support stuff
  services.accounts-daemon.enable = true;
  #encryption and security stuff
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
  security.polkit.enable = true;
  #required to read battery
  services.upower.enable = true;
  #required for some monitors
  hardware.i2c.enable = true;
  #i do not like power button immediately shutting down my system
  services.logind.settings.Login = {
    HandlePowerKey = lib.mkDefault "ignore";
  };
  #enable dms greetd implementation
  programs.dankMaterialShell = {
    greeter = {
      enable = true;
      compositor.name = "niri";
      configFiles = [ "/home/nikki/.config/DankMaterialShell/settings.json" ];
      configHome = "/home/nikki";
    };
  };

  environment.systemPackages = with pkgs; [
    inputs.quickshell.packages.${pkgs.system}.default
    xwayland-satellite
    cava
    cliphist
    matugen
    wl-clipboard
    brightnessctl
    gammastep
    glib
    ddcutil
    libsForQt5.qt5ct
    kdePackages.qt6ct
    hyprpolkitagent
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
      };
    };
  };
}
