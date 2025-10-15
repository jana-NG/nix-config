# my personal nix configuration
this is my nixos setup designed to provide unified styling and a simple, personalized workflow. i primarily use the niri compositor, but this repository also includes configuration files for kde plasma incase i want to use a traditional desktop environment.

## my devices
- workstation
  - powerful custom-built computer and my main workstation
- x13 gen 1 amd
  - older but capable laptop which i use to code on the go
- minibook x
  - lightweight easy to carry modern netbook

## file structure
- environment/: contains desktop environments and window managers
- home/: contains home-manager configuration
  - home/hosts/: contains home-manager configuration specific to my devices
  - home/modules/: contains different applications and their configurations to be included by ../hosts/
- hosts/: contains configuration specific to my devices
- modules/: contains different applications and their configurations to be included by ../hosts/
  - modules/profiles/: contains groups of applications and their configurations to be included by ../../hosts/


