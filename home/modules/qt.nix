{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.breeze
  ];
  qt.enable = true;
  qt.platformTheme.name = "qt6ct";
  qt.style.name = "qt6ct-style";
}
