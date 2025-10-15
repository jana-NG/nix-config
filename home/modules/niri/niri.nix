{
  pkgs,
  ...
}:
{

  imports = [
    ../hypridle.nix
  ];

  programs.dankMaterialShell = {
    enable = true;
  };

  home.file = {
    ".config/niri/config.kdl" = {
      enable = true;
      source = pkgs.replaceVars ./config.kdl {
        # kwalletPam = pkgs.kdePackages.kwallet-pam;
        # polkit-kde-agent = pkgs.kdePackages.polkit-kde-agent-1;
        DEFAULT_AUDIO_SINK = null;
      };
    };
  };

  home.packages = with pkgs; [
    pavucontrol
    libnotify
    gcr
  ];
}
