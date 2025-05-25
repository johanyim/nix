{
  pkgs,
  lib,
  baseColors,
  ...
}:
let
  font_family = "Departure Mono";
  battery = pkgs.writeShellScriptBin "battery" ''
    for battery in /sys/class/power_supply/BAT?*; do
      capacity="$(cat "$battery/capacity" 2>&1)"
      case "$(cat "$battery/status" 2>&1)" in
        "Full") status="  " ;;
        "Charging") status="󰚥 " ;;
        "Discharging") status="  " ;;
        "Critical") status="󱈸 " ;;
        "Not charging") status="  " ;;
        "Unknown") status=" " ;;
        *) exit 1 ;;
      esac
      ending="%"
      case 1 in
        $((capacity >= 100))) icon="󱟢 " ;;
        $((capacity >= 70))) icon="󱊣 " ;;
        $((capacity >= 30))) icon="󱊢 " ;;
        $((capacity >= 1))) icon="󱊡 " ;;
        *) icon="󰂎 " ;;
      esac
      printf "%s %s%s%+3s%s\n" "$(basename "''${battery}")" "$status" "$icon" "$capacity" "$ending"
    done
  '';
  rgb = lib.mapAttrs (name: hex: "rgb(${hex})") baseColors;
in

{
  programs.hyprlock = {
    enable = true;
    settings = {

      general = {
        hide_cursor = false;
        ignore_empty_input = true;
        immediate_render = true;
        fail_timeout = 100;
      };

      animations.enabled = false;

      background = [
        {
          monitor = "";
          path = "";
          color = rgb.crust;
          blur_passes = 0;
        }
      ];

      input-field = [
        {
          inherit font_family;
          monitor = "";
          size = "20%, 5%";
          halign = "center";
          valign = "center";
          position = "0, -20";

          outline_thickness = 2;

          outer_color = rgb.subtext0;
          inner_color = "rgba(0, 0, 0, 0.0)"; # no fill

          check_color = rgb.lavender;
          fail_color = rgb.red;

          font_color = rgb.text;
          fade_on_empty = false;
          rounding = 4;

          placeholder_text = "";
          fail_text = "$PAMFAIL";

          capslock_color = rgb.peach;

          dots_size = 0.2;
          dots_spacing = 0.5;
          dots_rounding = 0;
          dots_center = false;
        }
      ];

      # TIME
      label = [
        {
          inherit font_family;
          monitor = "";
          color = rgb.subtext0;
          text = "cmd[update:60000] date +' %Y-%m-%d %a <br/>󰥔 %I:%M %p' | sed -e 's/am/AM/' -e 's/pm/PM/'";
          font_size = 20;

          position = "0, -20";

          halign = "center";
          valign = "top";
        }
        {
          inherit font_family;
          monitor = "";
          color = rgb.subtext0;
          text = "cmd[update:60000] ${battery}/bin/battery";
          font_size = 16;
          position = "-16, -8";
          halign = "right";
          valign = "top";
        }

      ];

      # BATTERY

    };
  };

}
