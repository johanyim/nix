{
  lib,
  baseColors,
  pkgs,
  config,
  ...
}:
let
  hex = lib.mapAttrs (name: hex: "#${hex}") baseColors;
in
{
  programs.wezterm = {
    enable = true;

    enableZshIntegration = true;
    colorSchemes = {
      catppuccin = {
        ansi = [
          hex.surface1
          hex.red
          hex.green
          hex.yellow
          hex.blue
          hex.pink
          hex.teal
          hex.subtext1
        ];
        brights = [
          hex.surface1
          hex.red
          hex.green
          hex.yellow
          hex.surface2
          hex.pink
          hex.teal
          hex.subtext0
        ];
        background = hex.crust;
        cursor_bg = hex.text;
        # cursor_border = "#BEAF8A";
        cursor_fg = hex.crust;
        foreground = hex.text;
        selection_bg = hex.base;
        selection_fg = hex.yellow;
      };
    };

  };

}
