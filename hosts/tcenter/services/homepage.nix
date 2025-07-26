{ pkgs-stable, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    package = pkgs-stable.homepage-dashboard;
  };
}
