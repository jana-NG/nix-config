# this file contains development stuff
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dtc
    micro-with-wl-clipboard
    rustup
    gcc
    git
    zed-editor
    vscode-fhs
  ];
}
