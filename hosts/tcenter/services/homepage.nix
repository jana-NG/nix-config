{ pkgs-stable, ... }:
{
  services.glances = {
    enable = true;
    openFirewall = true;
  };
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
        "Tools" = [
          {
            "File Browser" = {
              description = "Simple and powerful file browser";
              href = "https://tcenter.fritz.box:8081";
            };
          }
        ];
      }
      {
        "Media" = [
          {
            "Jellyfin" = {
              description = "Media Library";
              href = "http://tcenter.fritz.box:8096";
            };
          }
        ];
      }

    ];
  };
}
