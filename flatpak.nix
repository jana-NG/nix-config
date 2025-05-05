{ lib, ... }: {

  # Add a new remote. Keep the default one (flathub)
  #services.flatpak.remotes = lib.mkOptionDefault [{
  #  name = "flathub-beta";
  #  location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
  #}];

  services.flatpak.update.auto.enable = true;
  #services.flatpak.uninstallUnmanaged = false;

  # Add here the flatpaks you want to install
  services.flatpak.packages = [
    #{ appId = "com.brave.Browser"; origin = "flathub"; }
    #"com.obsproject.Studio"
    #"im.riot.Riot"
    "app.zen_browser.zen"
    "org.libreoffice.LibreOffice"
    "org.gnome.World.PikaBackup"
    "com.github.KRTirtho.Spotube"
    "com.discordapp.Discord"
    "com.github.tchx84.Flatseal"
    "org.prismlauncher.PrismLauncher"
    "com.github.iwalton3.jellyfin-media-player"
    "md.obsidian.Obsidian"
    "org.kde.krita"
    "com.geekbench.Geekbench6"
    "com.rustdesk.RustDesk"
    "org.gtk.Gtk3theme.Breeze"
    "com.makemkv.MakeMKV"
    "fr.handbrake.ghb"
  ];
  services.flatpak.overrides = {
    global = {
      # Force Wayland by default
      Context.sockets = ["wayland" "!x11" "!fallback-x11"];

      Environment = {
        # Fix un-themed cursor in some Wayland apps
        XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
      };
    };
  };
 }
