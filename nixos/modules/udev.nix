{ pkgs, ... }:
let
  thing = pkgs.writeShellScriptBin "thing" ''
    export DISPLAY=:0
    export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

    ${pkgs.dbus}/bin/dbus-send \
    --session \
    --dest=org.freedesktop.Notifications \
    --type=method_call \
    /org/freedesktop/Notifications \
    org.freedesktop.Notifications.Notify \
    string:"udev" \
    uint32:0 \
    string:"dialog-information" \
    string:"Charger status changed" \
    string:"AC adapter plugged or unplugged." \
    array:string: \
    dict:string:string: \
    int32:5000
  '';
in
{
  # UDEV  [226.648987] change   /devices/platform/USBC000:00/power_supply/ucsi-source-psy-USBC000:001 (power_supply)
  services.udev.extraRules = ''
    SUBSYSTEM=="power_supply", ACTION=="change", ENV{POWER_SUPPLY_ONLINE}=="1", RUN+="${thing}/bin/thing"
    SUBSYSTEM=="power_supply", ACTION=="change", ENV{POWER_SUPPLY_ONLINE}=="0", RUN+="${thing}/bin/thing"
  '';
}
