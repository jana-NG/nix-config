# this file contains shell configurations
{ pkgs, ... }:
{

  # Enable Zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Starship config

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 1300;
      scan_timeout = 50;
      format = "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
      username = {
        format = "[$user]($style) ";
        show_always = true;
        style_root = "red bg:0x9A348E";
        style_user = "purple bg:0x9A348E";
        disabled = false;
      };
    };
  };
  environment.systemPackages = with pkgs; [
    zsh
    starship
  ];

}
