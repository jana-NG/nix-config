# this file contains additional applications for environments that do not have an app suite
{ pkgs, pkgs-stable, ... }:
{
  # file manager
  programs.xfconf.enable = true;
  services.tumbler.enable = true;
  services.gvfs.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
    ];
  };
  environment.systemPackages =
    (with pkgs; [
      xfce.ristretto
    ])

    ++

      (with pkgs-stable; [ ]);
  # services.flatpak.packages = [ ];
}
