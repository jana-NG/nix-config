# this file contains packages for my personal systems
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    signal-desktop
    ani-cli
    qbittorrent
    yt-dlp
    wineWow64Packages.waylandFull
    pinta
    qdiskinfo
    ristretto
  ];
  services.flatpak.packages = [
    "com.github.iwalton3.jellyfin-media-player"
    "com.geekbench.Geekbench6"
    "com.rustdesk.RustDesk"
    "com.makemkv.MakeMKV"
    "fr.handbrake.ghb"
    "com.discordapp.Discord"
    "de.bund.ausweisapp.ausweisapp2"
    "com.usebottles.bottles"
  ];
}
