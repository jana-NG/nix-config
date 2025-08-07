# this file contains development stuff
{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages =
    (with pkgs; [
      dtc
      rustup
      gcc
      vscode-fhs
      openssl
      pkg-config
    ])

    ++

      (with pkgs-stable; [
        arduino-ide
        rpi-imager
      ]);
  # services.flatpak.packages = [ ];
}
