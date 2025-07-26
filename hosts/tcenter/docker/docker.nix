# this file contains misc service configuration
{ ... }:
{
  virtualization.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
