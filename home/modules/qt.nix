{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.breeze
  ];
  /*
    add the following lines to kdeglobals and dolphinrc to fix theme issues:

    [UiSettings]
    ColorScheme=qt6ct
  */

  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style.name = "qt6ct-style";
    qt6ctSettings = {
      Appearance = {
        style = "Breeze";
        icon_theme = "Colloid-Purple-Catppuccin-Dark";
        standard_dialogs = "default";
      };
      Fonts = {
        fixed = "\"BlexMono Nerd Font,11\"";
        general = "\"Ubuntu Nerd Font,11\"";
      };
    };
  };
}
