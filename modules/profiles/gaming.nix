# this file contains xfce applications
{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    package = pkgs.steam.override {
      extraPkgs =
        pkgs: with pkgs; [
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib # Provides libstdc++.so.6
          libkrb5
          keyutils
          # Add other libraries as needed
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

  environment.systemPackages = with pkgs; [
    prismlauncher
    steamtinkerlaunch
    ryubing
    protonup-qt
    mangohud
    heroic
  ];
  services.flatpak.packages = [
    "com.steamgriddb.steam-rom-manager"
    "com.dec05eba.gpu_screen_recorder"
  ];
}
