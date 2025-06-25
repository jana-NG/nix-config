# this file contains development stuff
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dtc
    rustup
    gcc
    vscode-fhs
    openssl
    pkg-config
    arduino-ide
    rpi-imager
  ];
}
