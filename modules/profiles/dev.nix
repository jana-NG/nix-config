# this file contains development stuff
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dtc
    rustup
    gcc
    openssl
    pkg-config
    rpi-imager
    zed-editor
  ];
}
