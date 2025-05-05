# this file contains packages for my personal systems
{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  programs.gamemode.enable = true;
  environment.systemPackages = with pkgs; [
    signal-desktop
    ani-cli
    protonup
    mangohud
    heroic
    protonvpn-gui
    qbittorrent
  ];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
