# this file contains basic programs i use
{
  pkgs,
  ...
}:
{
  # Install firefox.
  programs.appimage = {
    enable = true;
  };
  programs.firefox.enable = true;
  programs.localsend.enable = true;

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
    corefonts
  ];
  # Fix for dolphin application menu
  environment.etc."/xdg/menus/applications.menu".text =
    builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nil
    libsecret
    nixfmt-rfc-style
    haruna
    nvtopPackages.amd
    xsettingsd
    xorg.xrdb
    ffmpeg-full
    krita
    qownnotes
    kdePackages.kalk
    kdePackages.filelight
    kdePackages.krecorder
    kdePackages.kclock
    kdePackages.kate
    kdePackages.neochat
    kdePackages.konsole
    kdePackages.dolphin
    kdePackages.qtsvg
    kdePackages.ffmpegthumbs
    kdePackages.kdegraphics-thumbnailers
    kdePackages.kio-fuse # to mount remote filesystems via FUSE
    kdePackages.kio-extras # extra protocols support (sftp, fish and more)
    kdePackages.ark
    kdePackages.qtimageformats
    kdePackages.kde-cli-tools
    calibre
    libreoffice-qt6
    pciutils
    usbutils
    xorg.xeyes
    drawio
  ];

  # flatpak configuration
  services.flatpak.enable = true;
  services.flatpak.update.auto.enable = true;
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
  # Run unpatched dynamic binaries on NixOS.
  programs.nix-ld = {
    enable = true;
  };
}
