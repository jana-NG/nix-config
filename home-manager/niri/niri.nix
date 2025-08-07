{
  pkgs,
  ...
}:
{
  home.file = {
    ".config/niri/config.kdl" = {
      enable = true;
      source = pkgs.replaceVars ./config.kdl {
        kwalletPam = pkgs.kdePackages.kwallet-pam;
        polkit-kde-agent = pkgs.kdePackages.polkit-kde-agent-1;
        DEFAULT_AUDIO_SINK = null;
      };
    };
  };
  home.sessionVariables = {
    DISPLAY = ":O";
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

  /*
    services.swayidle =
    let
      # Lock command
      lock = "qs -c DankMaterialShell ipc call lock lock";
      # Niri
      display = status: "${pkgs.niri}/bin/niri msg action power-${status}-monitors";
    in
    {
      enable = true;
      timeouts = [
        {
          timeout = 300;
          command = display "off";
          resumeCommand = display "on";
        }
        {
          timeout = 600; # in seconds
          command = "${pkgs.libnotify}/bin/notify-send 'Locking in 5 seconds' -t 5000";
        }
        {
          timeout = 605;
          command = lock;
        }
        {
          timeout = 3600;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
      events = [
        {
          event = "before-sleep";
          # adding duplicated entries for the same event may not work
          command = (display "off") + "; " + lock;
        }
        {
          event = "after-resume";
          command = display "on";
        }
        {
          event = "lock";
          command = (display "off") + "; " + lock;
        }
        {
          event = "unlock";
          command = display "on";
        }
      ];
    };
  */
  home.packages = with pkgs; [
    sway-audio-idle-inhibit
    pavucontrol
    kitty
    libnotify
  ];
}
