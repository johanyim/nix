{ pkgs, ... }:
{
  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", ENV{POWER_SUPPLY_STATUS}=="Charging", RUN+="${pkgs.libnotify}/bin/notify-send hello"
  '';

}
