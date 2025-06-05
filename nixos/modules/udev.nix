{ pkgs, ... }:
let
  x = pkgs.writeShellScriptBin "thing" ''
    ${pkgs.libnotify}/bin/notify-send "Battery is connected"
  '';
in
{
  # UDEV  [226.648987] change   /devices/platform/USBC000:00/power_supply/ucsi-source-psy-USBC000:001 (power_supply)
  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", ENV{POWER_SUPPLY_ONLINE}=="1", RUN+="${x}/bin/thing"
  '';
}
