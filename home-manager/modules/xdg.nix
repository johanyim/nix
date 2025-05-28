{ pkgs, ... }:
let
  port_killer = import ../scripts/port_killer.nix { inherit pkgs; };
in
{
  # TODO: Set the default applications
  xdg.mimeApps.defaultApplications = { };

  # port killer script
  xdg.desktopEntries.port_killer = {
    name = "Port Killer";
    comment = "Kill the process listening on ports";
    exec = "${port_killer}/bin/port_killer";
    icon = "utilities-terminal";
    terminal = false;
    categories = [ "Utility" ];
  };

}
