{ pkgs-stable, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    listenPort = 8080;
    package = pkgs-stable.homepage-dashboard;
    allowedHosts = "tcenter.fritz.box:8080";
  };
}
