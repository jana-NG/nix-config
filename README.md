# my personal nix configuration
## intended goals
> create a configuration that aims to reduce the work required to maintain multiple hosts at once. settings up new devices should be as easy as possible 

## structure
- environment: Includes Desktop Environments, Window Managers and Display Managers.
- home-manager: Configuration for the Home-Manager module
- hosts: Configuration specific to my various systems
- packages: Commonly used software
- system: Commonly used system services, boot and kernel configuration

## hosts
- default
> includes common config like timezone and enabling wifi + bluetooth

- a485
> personal laptop
> > model: thinkpad a485
> > cpu: ryzen 3 2300U
> > ram: 32 GB
> > display: 1920x1080@60

- minibook
> personal laptop, quirks: kernel module for tablet mode
> > device: chuwi minibook x n100
> > cpu: intel n100
> > ram: 12 GB
> > display: 1920x1200@50
> > quirks: kernel module for tablet mode

- tcenter
> home center, configuration is very divorced from the other devices
> > device: thinkcentre m720s
> > cpu: intel i5-8400
> > ram: 16 GB

- workstation
> my tower at home
> > cpu: ryzen 7 5800x3d
> > gpu: radeon rx 6700xt
> > ram: 32 GB
> > display: 2560x1440@360 - 2560x1440@144

- x13g1amd
> personal laptop
> > cpu: ryzen 5 4600
> > ram: 16 GB
> > display: 1920x1080@60

## todo
- secret management
- configure x220t and add to config
- fix home-assistant in tcenter (replace with docker container?)
