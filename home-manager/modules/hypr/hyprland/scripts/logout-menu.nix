{
  lib,
  baseColors,
  pkgs,
  ...
}:
let
  hex = lib.mapAttrs (name: color: "#${color}") baseColors;
in
pkgs.writeShellScriptBin "logout-menu" ''
  option=$(printf "\
   Lock
  󰒲 Sleep
  󰤄 Hibernate
   Shutdown
   Restart
  󰗽 Logout
  " | ${pkgs.rofi}/bin/rofi -theme-str "
  element-text { text-color: ${hex.text}; } 
  window { width: 14ch; height: 18ch; }
  " -dmenu -i -p "" -font "Departure Mono 16" | 
  awk -F' ' '{ print $2 }')

  case $option in
  "Lock")
  	${pkgs.hyprlock}/bin/hyprlock
  	;;
  "Suspend")
  	${pkgs.systemd}/bin/systemctl suspend
  	;;
  "Hibernate")
  	${pkgs.systemd}/bin/systemctl hibernate
  	;;
  "Shutdown")
  	${pkgs.systemd}/bin/systemctl poweroff
  	;;
  "Restart")
  	${pkgs.systemd}/bin/systemctl reboot
  	;;
  "Logout")
  	${pkgs.hyprland}/bin/hyprctl --instance 0 dispatch exit
  	;;
  esac
''
