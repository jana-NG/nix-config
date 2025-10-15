{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
  ];
  qt.enable = true;
  qt.style.name = "kvantum";
  qt.platformTheme.name = "kvantum";
}
