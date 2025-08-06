{
  pkgs,
  ...
}:
{
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
  home.sessionVariables = {
    DISPLAY = ":O";
  };
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit
  home.packages = with pkgs; [
    swaybg # wallpaper
    swaynotificationcenter # notification daemon
    pavucontrol
    kitty
  ];
}
