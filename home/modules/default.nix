{
  pkgs,
  ...
}:

{
  imports = [
    ./git.nix
    ./zsh.nix
  ];
  home.username = "nikki";
  home.homeDirectory = "/home/nikki";
  home.sessionVariables = {
    EDITOR = "micro";
    ANI_CLI_PLAYER = "haruna";
    TERMINAL = "konsole";
  };

  programs.btop.enable = true;

  programs.micro = {
    enable = true;
    package = pkgs.micro-with-wl-clipboard;
  };

  home.stateVersion = "24.11";
}
