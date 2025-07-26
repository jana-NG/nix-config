{ ... }:
{
  services.home-assistant = {
    enable = true;
    openFirewall = true;
    configWritable = true;
  };
}
