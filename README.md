# my personal nix configuration
## file structure
- environment/: contains desktop environments and window managers
- home/: contains home-manager configuration
  - home/hosts/: contains home-manager configuration specific to my devices
  - home/modules/: contains different applications and their configurations to be included by ../hosts/
- hosts/: contains configuration specific to my devices
- modules/: contains different applications and their configurations to be included by ../hosts/
  - modules/profiles/: contains groups of applications and their configurations to be included by ../../hosts/


