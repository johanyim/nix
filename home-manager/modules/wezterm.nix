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

    extraConfig = # lua
      ''
        return {
          audible_bell = "Disabled",

          adjust_window_size_when_changing_font_size = false,
          bold_brightens_ansi_colors = true,
          cell_width = 0.9,
          -- cell_width = 1,
          line_height = 1.0,
          -- line_height = 1.1,
          cursor_blink_rate = 0,
          disable_default_mouse_bindings = false,
          -- enable_tab_bar = false,
          hide_tab_bar_if_only_one_tab = true,
          scrollback_lines = 5000,
          window_close_confirmation = "NeverPrompt",

          color_schemes = {
            ["Catppuccin Mocha Ext"] = custom,
          },
          color_scheme = "catppuccin",
          font = wezterm.font("NotoSansM Nerd Font"),
          -- font = wezterm.font("ProFont IIx Nerd Font"),
          -- font = wezterm.font("Tamzen"),
          -- font = wezterm.font("Monocraft Nerd Font"),
          -- font = wezterm.font("Miracode"),
          harfbuzz_features = { "calt=0", "clig=0", "liga=0" },

          keys = {
            {
              key = "Backspace",
              mods = "CTRL",
              action = wezterm.action.SendString("\x17"),
            },
          },
        }
      '';

  };

}
