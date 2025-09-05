# this file contains configuration for niri
{
  pkgs,
  inputs,
  /**
    pkgs-stable,
  */
  ...
}:
{
  imports = [
    ./sddm.nix
    ../packages/wmapps.nix
  ];
  #enable niri
  programs.niri.enable = true;
  services.accounts-daemon.enable = true;
  services.gnome.gnome-keyring.enable = true;
  programs.seahorse.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;
  security.polkit.enable = true;
  hardware.i2c.enable = true;
  services.logind.settings.Login = {
    HandlePowerKey = "ignore";
  };

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    inputs.quickshell.packages.${pkgs.system}.default
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
