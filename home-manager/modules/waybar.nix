{
  lib,
  baseColors,
  ...
}:
let
  hex = lib.mapAttrs (name: hex: "#${hex}") baseColors;
in
{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar.css;
    settings = [
      {
        layer = "bottom";
        position = "top";
        mode = "dock";
        spacing = 8;
        reload_style_on_change = true;
        height = 37;
        output = [
          "eDP-1"
        ];
        modules-left = [
          "hyprland/workspaces"
          "group/controls"
          "group/state"
        ];
        modules-center = [
          # "custom/hello-from-waybar"

          "group/usage"
        ];
        modules-right = [
          "group/connections"
          "group/life"
          "clock"
        ];

        pulseaudio = {
          format = "{icon} {volume}% {format_source}";
          format-source = "<span foreground='${hex.subtext0}'> ON </span>";
          format-source-muted = "<span foreground='${hex.overlay0}'> OFF</span>";
          format-muted = "󰸈 {volume}% {format_source}";

          format-icons = {
            default = [
              "󰕿"
              "󰖀"
              "󰕾"
            ];
          };
        };

        "group/controls" = {
          orientation = "horizontal";
          modules = [
            "pulseaudio"
            "backlight"
          ];

        };

        "group/state" = {
          orientation = "horizontal";
          modules = [
            "memory"
            "disk"
          ];
        };

        memory = {
          interval = 30;
          format = " {}%";
          tooltip-format = "{used}GiB/{total}GiB";
          max-length = 10;
        };

        disk = {
          interval = 1800;
          format = " 󰻂 {percentage_used}%";
          tooltip-format = "{used}/{total}";
          on-click = "alacritty -e dua i /";

          path = "/";
        };

        "group/connections" = {
          orientation = "horizontal";
          modules = [
            "network"
            "bluetooth"
          ];
        };

        network = {
          format = "{ifname} ";
          format-wifi = "󰖩 {essid} ";
          format-ethernet = "󰈀 Ethernet ";
          format-disconnected = "󰖪 None "; # An empty format will hide the module.
          tooltip-format = "{ifname}";
          tooltip-format-wifi = "{essid} ({signalStrength}%)\n{ifname} {ipaddr}/{cidr}";
          tooltip-format-ethernet = "{ifname} {ipaddr}/{cidr}";
          tooltip-format-disconnected = "Disconnected";
          on-click = "alacritty -e nmtui";
          max-length = 20;
        };

        bluetooth = {
          format = " {status}";

          format-off = "󰂲 {status}";
          format-no-controller = "󰂲 {status}";

          format-connected = "󰂰 {device_alias}";
          tooltip-format = "{num_connections} connected";
          tooltip-format-connected = "{num_connections} connected\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          on-click = "alacritty -e bluetuith";
        };

        cpu = {
          format = "{icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}";
          format-icons = [
            "<span foreground='${hex.overlay0}'>▁</span>"
            "<span foreground='${hex.text}'>▂</span>"
            "<span foreground='${hex.text}'>▃</span>"
            "<span foreground='${hex.text}'>▄</span>"
            "<span foreground='${hex.lavender}'>▅</span>"
            "<span foreground='${hex.lavender}'>▆</span>"
            "<span foreground='${hex.lavender}'>▇</span>"
            "<span foreground='${hex.rosewater}'>█</span>"
          ];
          on-click = "alacritty -e btm --default_widget_type processes -e";
        };

        "group/life" = {
          orientation = "horizontal";
          modules = [
            "battery"
            "temperature"
          ];

        };

        "group/usage" = {
          orientation = "horizontal";
          modules = [
            "cpu"
          ];
        };

        battery = {
          interval = 60;
          states = {
            "warning" = 30;
            "critical" = 10;
          };
          format-icons = [
            "󰂎"
            "󱊡"
            "󱊢"
            "󱊣"
            "󱟢"
          ];
          weighted_average = true;
          format = "{icon} {capacity}%";
          format-charging = "󰚥{icon} {capacity}%";
          on-click = "alacritty -e btm --battery --default_widget_type battery -e";
        };

        temperature = {
          format = " {icon} {temperatureC}°C";
          hwmon-path = "/sys/devices/platform/coretemp.0/hwmon/hwmon6/temp1_input";
          critical-threshold = 80;
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];

        };

        backlight = {
          device = "intel_backlight";
          format = " {icon} {percent}%";
          format-icons = [
            "󰃞"
            "󰃞"
            "󰃟"
            "󰃠"
          ];
        };

        "clock" = {
          interval = 60;
          format = " {:%Y-%m-%d %a 󰥔 %I:%M %p}";
        };

        "hyprland/workspaces" = {
          format = "{name}";
          persistent-workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
            "6" = [ ];
            "7" = [ ];
            "8" = [ ];
            "9" = [ ];
          };

        };

      }
    ];

  };

}
