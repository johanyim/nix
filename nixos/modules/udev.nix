{ pkgs, ... }:
let
  thing = pkgs.writeShellScriptBin "thing" ''
    export DISPLAY=:0
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"



  '';
in
{
  # UDEV  [226.648987] change   /devices/platform/USBC000:00/power_supply/ucsi-source-psy-USBC000:001 (power_supply)
  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", ACTION=="change", ENV{POWER_SUPPLY_ONLINE}=="1", RUN+="${pkgs.systemd}/bin/systemd-run --machine=johan@.host --user notify-send 'Changing Power States' 'Using battery power'"
    SUBSYSTEM=="power_supply", ACTION=="change", ENV{POWER_SUPPLY_ONLINE}=="0", RUN+="${thing}/bin/thing"
  '';
}
