{ ... }:
{
  services.homeassistant = {
    enable = true;
    openFirewall = true;
    configWritable = true;
  };
}
