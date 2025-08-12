{
  pkgs,
  ...
}:
{
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
  services.hypridle =
    let
      # Lock command
      lock = "qs -c DankMaterialShell ipc call lock lock";
      # Niri
      display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
    in
    {
      enable = true;
      settings = {
        general = {
          after_sleep_cmd = display "on";
          lock_cmd = lock;
        };
        listener = [
          {
            timeout = 300;
            on-timeout = display "off";
            on-resume = display "on";
          }
          {
            timeout = 420;
            on-timeout = lock;
          }
          {
            timeout = 3600;
            on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
          }
        ];
      };
    };

  home.packages = with pkgs; [
    sway-audio-idle-inhibit
    pavucontrol
    kitty
    libnotify
    gcr
  ];
}
