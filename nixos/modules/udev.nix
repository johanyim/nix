{ pkgs, ... }:
let
  thing = pkgs.writeShellScriptBin "thing" ''
    ${pkgs.libnotify}/bin/notify-send "Battery is connected"
  '';
in
{
  # UDEV  [226.648987] change   /devices/platform/USBC000:00/power_supply/ucsi-source-psy-USBC000:001 (power_supply)
  services.udev.extraRules = ''
       SUBSYSTEM=="power_supply", KERNEL=="AC", ATTR{online}=="1", RUN+="${thing}/bin/thing"
    SUBSYSTEM=="power_supply", KERNEL=="AC", ATTR{online}=="0", RUN+="${thing}/bin/thing"

  '';
}
