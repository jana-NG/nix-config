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
      name = "adw-gtk3-dark";
      package = (pkgs.adw-gtk3);
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
