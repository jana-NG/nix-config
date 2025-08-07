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
  ];
  #enable niri
  programs.niri.enable = true;
  security = {
    polkit.enable = true;
    pam.services = {
      login.kwallet = {
        enable = true;
        package = pkgs.kdePackages.kwallet-pam;
      };
      sddm = {
        kwallet = {
          enable = true;
          package = pkgs.kdePackages.kwallet-pam;
        };
      };
    };
  };
  hardware.i2c.enable = true;
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    inputs.quickshell.packages.${pkgs.system}.default
    cava
    cliphist
    matugen
    wl-clipboard
    ddcutil
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.kwallet
    kdePackages.kwallet-pam
    kdePackages.kwalletmanager
    kdePackages.polkit-kde-agent-1
  ];
  services.dbus.packages = with pkgs; [
    kdePackages.kwallet
  ];
  xdg.portal = {
    enable = true;
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
        "org.freedesktop.impl.portal.Secret" = "kwallet";
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
      };
    };
  };
}
