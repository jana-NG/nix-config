# this file contains packages for my personal systems
{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
    (with pkgs; [
      signal-desktop
      ani-cli
      protonvpn-gui
      qbittorrent
      yt-dlp
      wineWowPackages.waylandFull
      pinta
      qdiskinfo
      xfce.ristretto
    ])

    ++

      (with pkgs-stable; [
        gparted
        exfatprogs
      ]);
  services.flatpak.packages = [
    "com.github.iwalton3.jellyfin-media-player"
    "com.geekbench.Geekbench6"
    "com.rustdesk.RustDesk"
    "com.makemkv.MakeMKV"
    "fr.handbrake.ghb"
    "com.discordapp.Discord"
    "de.bund.ausweisapp.ausweisapp2"
    "com.usebottles.bottles"
    "org.nickvision.money"
  ];
}
