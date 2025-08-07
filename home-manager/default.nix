{
  pkgs,
  ...
}:

{
  home.sessionVariables = {
    EDITOR = "micro";
    ANI_CLI_PLAYER = "haruna";
  };

  programs.zed-editor.enable = true;

  programs.btop.enable = true;

  programs.micro = {
    enable = true;
    package = pkgs.micro-with-wl-clipboard;
  };

  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    dconf-editor
    gnome-themes-extra
  ];

  programs.fastfetch.enable = true;

  gtk = {
    enable = true;
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = "1";
    };
    theme = {
      name = "Colloid-Purple-Dark-Compact-Catppuccin/";
      package = (
        pkgs.colloid-gtk-theme.override {
          themeVariants = [ "purple" ];
          colorVariants = [ "dark" ];
          sizeVariants = [ "compact" ];
          tweaks = [
            "catppuccin"
            "normal"
          ];
        }
      );
    };
    iconTheme = {
      name = "Colloid-Purple-Catppuccin-Dark";
      package = (
        pkgs.colloid-icon-theme.override {
          schemeVariants = [ "catppuccin" ];
          colorVariants = [ "purple" ];
        }
      );
    };
  };

  qt.enable = true;
  qt.style.name = "kvantum";
  qt.platformTheme.name = "kvantum";

  catppuccin = {
    accent = "mauve";
    flavor = "mocha";
    enable = true;
    cursors.enable = true;
    gtk.icon.enable = false;
  };
}
