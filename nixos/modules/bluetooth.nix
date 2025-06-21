{ ... }:
{
  hardware.bluetooth.enable = false; # setting to true causes a permission issue
  # workaround: adding user to the group 'lp'
  hardware.bluetooth.powerOnBoot = true;
}
