# this file contains xfce applications
{ pkgs, pkgs-stable, ... }:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    package = pkgs.steam.override {
      extraPkgs =
        pkgs: with pkgs; [
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib # Provides libstdc++.so.6
          libkrb5
          keyutils
        ];
    };
    remotePlay.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs.gamemode.enable = true;

  environment.systemPackages =
    (with pkgs; [
      prismlauncher
      steamtinkerlaunch
      protonup
      mangohud
      heroic
    ])

    ++

      (with pkgs-stable; [ ]);
  # services.flatpak.packages = [ ];
}
