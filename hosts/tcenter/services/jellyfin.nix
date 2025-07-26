{ pkgs-stable, ... }:
{
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  environment.systemPackages = [
    pkgs-stable.jellyfin
    pkgs-stable.jellyfin-web
    pkgs-stable.jellyfin-ffmpeg
  ];
}
