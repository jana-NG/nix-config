# this file contains configuration for the cosmic desktop
{ pkgs, ... }:
{
  # Enable Cosmic Greeter
  services.displayManager.cosmic-greeter.enable
  # Enable Cosmic
  services.desktopManager.cosmic.enable = true;
  services.desktopManager.cosmic.xwayland.enable = true;
  services.dbus.enable = true;
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal-cosmic
    cosmic-bg
    cosmic-osd
    cosmic-term
    cosmic-idle
    cosmic-edit
    cosmic-comp
    cosmic-store
    cosmic-randr
    cosmic-panel
    cosmic-icons
    cosmic-files
    cosmic-player
    cosmic-session
    cosmic-greeter
    cosmic-ext-ctl
    cosmic-applets
    cosmic-settings
    cosmic-launcher
    cosmic-protocols
    cosmic-wallpapers
    cosmic-ext-tweaks
    cosmic-applibrary
    cosmic-design-demo
    cosmic-notifications
    cosmic-ext-calculator
    cosmic-settings-daemon
    dosmic-workspaces-epoch
    tasks
  ];
}
