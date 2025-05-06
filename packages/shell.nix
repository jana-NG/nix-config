# this file contains shell configurations
{ pkgs, ... }:
{

  # Starship config
  environment.systemPackages = with pkgs; [
    zsh
    starship
  ];

}
