# this file contains basic programs i use
{
  pkgs,
  pkgs-stable,
  ...
}:
{
  # Install firefox.
  security.sudo-rs.enable = true;
  programs.firefox.enable = true;
  programs.kdeconnect.enable = true;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  programs.dconf.enable = true;
  boot.loader.systemd-boot.configurationLimit = 4;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 4d";
  };
  nix.settings.auto-optimise-store = true;

  #Add Fonts
  fonts.fontDir.enable = true;

  fonts.packages = with pkgs; [
    ibm-plex
    nerd-fonts.blex-mono
    inter
    jetbrains-mono
    material-design-icons
    material-icons
    material-symbols
    nerd-fonts.fira-code
    fira-code
    fira-code-symbols
    nerd-fonts.ubuntu
    nerd-fonts.symbols-only
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    (with pkgs; [
      nil
      libsecret
      nixfmt-rfc-style
      haruna
      nvtopPackages.full
      xsettingsd
      xorg.xrdb
      ffmpeg-full
      krita
      kdePackages.marknote
      kdePackages.kweather
      kdePackages.kalk
      kdePackages.filelight
      kdePackages.krecorder
      kdePackages.kclock
      kdePackages.kate
      kdePackages.neochat
      kdePackages.konsole
      kdePackages.dolphin
      kdePackages.qtimageformats
      kdePackages.kde-cli-tools
    ])

    ++

      (with pkgs-stable; [
        libreoffice-qt6
        pciutils
        usbutils
        xorg.xeyes
        drawio
      ]);
  services.flatpak.update.auto.enable = true;
  #services.flatpak.uninstallUnmanaged = false;

  # Add here the flatpaks you want to install
  services.flatpak.packages = [
    "org.gnome.World.PikaBackup"
    "com.github.tchx84.Flatseal"
    "md.obsidian.Obsidian"
    "org.gtk.Gtk3theme.Breeze"
    "org.kde.kamoso"
  ];
  services.flatpak.overrides = {
    global = {
      Environment = {
        # Fix un-themed cursor in some Wayland apps
        XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";
      };
    };
  };
  # Fix Flatpaks not being able to use xdg-open
  systemd.user.extraConfig = ''
    DefaultEnvironment="PATH=/run/wrappers/bin:/etc/profiles/per-user/%u/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin"
  '';
}
