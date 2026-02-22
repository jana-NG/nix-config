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
    BROWSER = "firefox";
    EXPLORER = "dolphin";
  };

  xdg.configFile."mimeapps.list".force = true;
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "micro.desktop";
      "text/markdown" = "micro.desktop";
      "text/plain" = "micro.desktop";

      "image/png" = "org.xfce.ristretto.desktop";
      "image/jpeg" = "org.xfce.ristretto.desktop";
      "image/gif" = "org.xfce.ristretto.desktop";
      "image/webp" = "org.xfce.ristretto.desktop";

      "video/mp4" = "haruna.desktop";

      "application/pdf" = "firefox.desktop";

      "inode/directory" = "dolphin.desktop";

      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/heroic" = "com.heroicgameslauncher.hgl.desktop";
      "x-scheme-handler/sgnl" = "signal.desktop";
    };
  };

  programs.btop.enable = true;

  programs.micro = {
    enable = true;
    package = pkgs.micro-with-wl-clipboard;
  };

  programs.zed-editor.enable = true;

  home.stateVersion = "24.11";
}
