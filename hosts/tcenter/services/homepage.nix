{ pkgs-stable, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    listenPort = 80;
    package = pkgs-stable.homepage-dashboard;
    allowedHosts = "tcenter.fritz.box:80";
  };
}
