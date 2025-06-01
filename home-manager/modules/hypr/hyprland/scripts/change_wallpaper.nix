{ self, pkgs, ... }:
let
  display = "eDP-1";
in
pkgs.writeShellScriptBin "change_wallpaper" ''
  selection=$(ls -1 ${self + "/wallpaper/"} | rofi -dmenu -p "Change Wallpaper")
  path="${self + "/wallpaper/"}$selection"
  notify-send "Wallpaper changed to $selection"
  hyprctl hyprpaper preload $path
  hyprctl hyprpaper wallpaper "${display},''${path}"
''
