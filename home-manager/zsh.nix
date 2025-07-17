{
  ...
}:

{
  # zsh config
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      export ANI_CLI_PLAYER="haruna"
    '';
    shellAliases = {
      ll = "ls -l";
      uppies = "nix flake update --flake path:$HOME/.config/nixos && sudo nixos-rebuild switch --flake path:$HOME/.config/nixos --upgrade";
      nrs = "sudo nixos-rebuild switch --flake path:$HOME/.config/nixos/";
      nixedit = "kate ~/.config/nixos";
      homeedit = "kate ~/.config/home-manager";
    };
  };
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
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
