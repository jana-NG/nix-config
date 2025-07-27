{ pkgs-stable, ... }:
let
  background_srs = "/etc/nixos/hosts/tcenter/homepage/background.jpg";
  package = pkgs-stable.homepage-dashboard.overrideAttrs (oldAttrs: {
    postInstall = ''
      mkdir -p $out/share/homepage/public/images
      ln -s ${background_srs} $out/share/homepage/public/images/background.jpg
    '';
  });
in
{
  services.glances = {
    enable = true;
    openFirewall = true;
  };

  services.homepage-dashboard = {
    enable = true;
    listenPort = 8080;
    package = package;
    allowedHosts = "tcenter.fritz.box:8080";
    # https://gethomepage.dev/configs/settings/
    settings = {
      title = "the tcenter";
      background = {
        image = "/images/background.jpg";
        opacity = "50";
      };
      cardBlur = "2xl";
    };

    # https://gethomepage.dev/configs/bookmarks/
    bookmarks = [ ];

    # https://gethomepage.dev/configs/services/
    services = [
      {
        "Tools" = [
          {
            "File Browser" = {
              description = "Simple and powerful file browser";
              href = "http://tcenter.fritz.box:8081";
            };
          }
          {
            "Home Assistant" = {
              description = "Smart Home Controller";
              href = "http://tcenter.fritz.box:8123";
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
    widgets = [
      {
        resources = {
          cpu = true;
          disk = "/";
          memory = true;
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];
  };
}
