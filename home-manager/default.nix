{
  pkgs,
  ...
}:

{
  home.sessionVariables = {
    EDITOR = "micro";
    NIXOS_OZONE_WL = "1";
    ANI_CLI_PLAYER = "haruna";
  };
  programs.zed-editor.enable = true;
  programs.btop.enable = true;
  programs.micro = {
    enable = true;
    package = pkgs.micro-with-wl-clipboard;
  };
  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
  ];
  programs.fastfetch.enable = true;
  gtk.enable = true;
  qt.enable = true;
  qt.style.name = "kvantum";
  qt.platformTheme.name = "kvantum";
  catppuccin = {
    accent = "mauve";
    flavor = "mocha";
    enable = true;
  };
}
