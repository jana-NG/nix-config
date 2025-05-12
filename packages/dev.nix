# this file contains development stuff
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dtc
    rustup
    rust-analyzer
    gcc
    vscode-fhs
  ];
}
