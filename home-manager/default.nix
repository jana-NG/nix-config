{ config, pkgs, inputs, ... }:

{
  home.sessionVariables = {
    EDITOR = "micro";
    NIXOS_OZONE_WL = "1";
    ANI_CLI_PLAYER= "haruna";
  };
  programs.zed-editor.enable = true;
  programs.btop.enable = true;
  programs.micro.enable = true;
  programs.fastfetch.enable = true;
  gtk.enable = true;
  catppuccin = {
    accent = "mauve";
    flavor = "mocha";
    enable = true;
    gtk = {
      enable = true;
      accent = "mauve";
      flavor = "mocha";
      tweaks = [ "normal" ];
      icon = {
        enable = true;
        flavor = "mocha";
        accent = "mauve";
      };
    };
  };
}
