{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/058f5dac-2c81-4aeb-873b-3cbce2f26d4f";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/7FCE-7B40";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  fileSystems."/run/media/nikki/satassd0" = {
    device = "/dev/disk/by-uuid/417653d8-96ce-4f5d-bf65-b9b074e8383b";
    fsType = "ext4";
    options = [
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "exec" # Permit execution of binaries and other executable files
    ];
  };

  fileSystems."/run/media/nikki/hdd0" = {
    device = "/dev/disk/by-uuid/54a19fe7-041d-4af5-87cd-485453c3758e";
    fsType = "ext4";
    options = [
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "exec" # Permit execution of binaries and other executable files
    ];
  };

  fileSystems."/run/media/nikki/satassd1" = {
    device = "/dev/disk/by-uuid/d8208035-ed9c-48a3-9f6f-3a4779fa1f7e";
    fsType = "ext4";
    options = [
      "users" # Allows any user to mount and unmount
      "nofail" # Prevent system from failing if this drive doesn't mount
      "exec" # Permit execution of binaries and other executable files
    ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/b9ea833a-fe20-40e1-9faa-ad132f6a4d13"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp4s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
