# this file contains packages for my personal systems
{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.vivaldi.override {
      commandLineArgs = "--ozone-platform=wayland --enable-blink-features=MiddleClickAutoscroll";
    })
  ];
}
