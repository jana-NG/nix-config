{ pkgs-stable, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    listenPort = 8080;
    package = pkgs-stable.homepage-dashboard;
    allowedHosts = "tcenter.fritz.box:8080";
    # https://gethomepage.dev/configs/settings/
    settings = { };

    # https://gethomepage.dev/configs/bookmarks/
    bookmarks = [ ];

    # https://gethomepage.dev/configs/services/
    services = [
      {
        jellyfin = {
          url = "http://tcenter.fritz.box:8096";
          enableBlocks = true;
          enableNowPlaying = true;
          enableUser = true;
        };
      }
    ];

    # https://gethomepage.dev/widgets/
    widgets = [
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];
  };
}
