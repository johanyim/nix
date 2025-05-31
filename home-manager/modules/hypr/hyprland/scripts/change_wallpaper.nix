{ self, pkgs, ... }:
let
  display = "eDP-1";
in
pkgs.writeShellScriptBin "change_wallpaper" ''
  selection=$(ls -1 ${self + "/wallpaper/"} | rofi -dmenu)

  notify-send "$selection"
  hyprctl hyprpaper preload $selection
  hyprctl hyprpaper wallpaper "${display},''${selection}"
''
