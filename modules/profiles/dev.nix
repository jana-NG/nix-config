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
      rpi-imager
    ])

    ++

      (with pkgs-stable; [
        arduino-ide
      ]);
  # services.flatpak.packages = [ ];
}
