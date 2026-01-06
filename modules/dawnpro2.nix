# this configuration is required to get the online EQ working on the moondrop dawn pro 2
{ ... }:
{
  services.udev.extraRules =
    let
      vendor_moondrop = "35d8";
      device_dawnpro2 = "011d";
    in
    ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="${vendor_moondrop}", ATTRS{idProduct}=="${device_dawnpro2}", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
}
