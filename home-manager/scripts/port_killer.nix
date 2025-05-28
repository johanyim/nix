{ pkgs }:
pkgs.writeShellScriptBin "port_killer" ''
  ${pkgs.lsof}/bin/lsof -iTCP -sTCP:LISTEN -Pn | 
  awk 'NR>1 {print $9, $1, $2}' |
  ${pkgs.rofi}/bin/rofi -dmenu
''
