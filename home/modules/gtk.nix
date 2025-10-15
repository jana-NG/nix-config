{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    dconf-editor
    gnome-themes-extra
  ];
  gtk = {
    enable = true;
    font.name = "Ubuntu Nerd Font";
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
}
