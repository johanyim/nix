{ self, pkgs, ... }:
let
  display = "eDP-1";
in
pkgs.writeShellScriptBin "hms" ''
  selection=$(ls -1 ${self + "/wallpaper/"} | rofi -dmenu)
  hyprctl hyprpaper preload $selection
  hyprctl hyprpaper wallpaper "${display},''${selection}"
''
