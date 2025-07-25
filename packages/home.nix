# this file contains packages for my personal systems
{ pkgs, pkgs-stable, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
  programs.gamemode.enable = true;
  programs.steam.gamescopeSession.enable = true;

  environment.systemPackages =
    (with pkgs; [
      signal-desktop
      ani-cli
      protonup
      mangohud
      heroic
      protonvpn-gui
      qbittorrent
      yt-dlp
      prismlauncher
      wineWowPackages.waylandFull
      gparted
    ])

    ++

      (with pkgs-stable; [

      ]);

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };
}
