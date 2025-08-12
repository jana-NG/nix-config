{
  pkgs,
  lib,
  /**
    pkgs-stable,
  */
  ...
}:
{
  catppuccin.sddm = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
    font = "Blex Mono Nerd Font";
    fontSize = "14";
    userIcon = true;
    clockEnabled = true;
  };
  services.xserver.enable = true;
  services.displayManager.sddm = {
    package = lib.mkDefault pkgs.kdePackages.sddm;
    enable = true;
    wayland = lib.mkDefault {
      enable = true;
      compositor = "kwin";
    };
  };
}
