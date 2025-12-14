{
  pkgs,
  ...
}:
{

  imports = [

  ];

  programs.dankMaterialShell = {
    enable = true;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dankMaterialShell changes
    };

    # Core features
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableVPN = true;
    enableBrightnessControl = true;
    enableColorPicker = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableSystemSound = true;
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
