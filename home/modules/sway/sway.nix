{ ... }:
{
  imports = [
    ../hypridle.nix
  ];
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = {
      input = {
        "*" = {
          xkb_layout = "us";
          xkb_variant = "de_se_fi";
        };
      };
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "konsole";
      startup = [
        # Launch Firefox on start
        { command = "librewolf"; }
      ];
    };
  };
  programs.librewolf = {
    enable = true;
    # Enable WebGL, cookies and history
    settings = {
      "webgl.disabled" = false;
      "privacy.resistFingerprinting" = false;
      "privacy.clearOnShutdown.history" = false;
      "privacy.clearOnShutdown.cookies" = false;
      "network.cookie.lifetimePolicy" = 0;
    };
  };
}
