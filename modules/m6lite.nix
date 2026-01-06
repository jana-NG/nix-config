# this configuration is required to get VIA working on the keychron m6 lite
{ ... }:
{
  services.udev.extraRules =
    let
      vendor_keychron = "3434";
      device_m6lite = "d064";
    in
    ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="${vendor_keychron}", ATTRS{idProduct}=="${device_m6lite}", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
}
