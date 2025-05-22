{ lib, baseColors, ... }:
let
  hex = lib.mapAttrs (name: hex: "#${hex}") baseColors;
in
{

  programs.bottom = {

    enable = true;
    settings = {
      styles.cpu = {
        all_entry_color = hex.rosewater;
        avg_entry_color = hex.maroon;
        cpu_core_colors = [
          hex.red
          hex.peach
          hex.yellow
          hex.green
          hex.sapphire
          hex.mauve
        ];
      };
      styles.memory = {
        ram_color = hex.green;
        cache_color = hex.red;
        swap_color = hex.peach;
        gpu_colors = [
          hex.sapphire
          hex.mauve
          hex.red
          hex.peach
          hex.yellow
          hex.green
        ];
        arc_color = hex.sky;
      };
      styles.network = {

        rx_color = hex.green;
        tx_color = hex.red;
        rx_total_color = hex.sky;
        tx_total_color = hex.green;
      };
      styles.battery = {

        high_battery_color = hex.green;
        medium_battery_color = hex.yellow;
        low_battery_color = hex.red;
      };
      styles.tables = {

        headers = {
          color = hex.flamingo;
        };
      };
      styles.graphs = {
        graph_color = hex.subtext0;
        legend_text = {
          color = hex.subtext0;
        };
      };
      styles.widgets = {

        border_color = hex.surface2;
        selected_border_color = hex.pink;
        widget_title = {
          color = hex.flamingo;
        };
        text = {
          color = hex.text;
        };
        selected_text = {
          color = hex.crust;
          bg_color = hex.mauve;
        };
        disabled_text = {
          color = hex.base;
        };
      };

    };

  };

}
