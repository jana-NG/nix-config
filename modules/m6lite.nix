# this configuration is required to get VIA working on the keychron m6 lite
{ ... }:
{
  services.udev.extraRules =
    let
      vendorKeychron = "3434";
      deviceM6lite = "d064";
    in
    ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="${vendorKeychron}", ATTRS{idProduct}=="${deviceM6lite}", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
}
