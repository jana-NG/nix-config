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

  #XDG Portals
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  #Add Fonts
  fonts.fontDir.enable = true;

  fonts.packages = with pkgs; [
    ibm-plex
    inter
    jetbrains-mono
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    (with pkgs; [
      nil
      libsecret
      nixfmt-rfc-style
      home-manager
      haruna
      nvtopPackages.full
      xsettingsd
      xorg.xrdb
      ffmpeg-full
      krita
    ])

    ++

      (with pkgs-stable; [
        libreoffice-qt6
        pciutils
        usbutils
        xorg.xeyes
        drawio
      ]);
}
