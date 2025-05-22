{ lib, baseColors, ... }:
let
  hex = lib.mapAttrs (name: hex: "#${hex}") baseColors;
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      # dynamic_title = true
      general.live_config_reload = true;
      # unfocused_hollow = true

      colors.indexed_colors = [
        {
          color = hex.peach;
          index = 16;
        }
        {
          color = hex.rosewater;
          index = 17;
        }
      ];

      colors.bright = {
        black = hex.surface2;
        blue = hex.blue;
        cyan = hex.teal;
        green = hex.green;
        magenta = hex.pink;
        red = hex.red;
        white = hex.subtext0;
        yellow = hex.yellow;
      };

      colors.cursor = {
        cursor = hex.text;
        text = hex.base;
      };

      colors.dim = {
        black = hex.surface1;
        blue = hex.blue;
        cyan = hex.teal;
        green = hex.green;
        magenta = hex.pink;
        red = hex.red;
        white = hex.subtext1;
        yellow = hex.yellow;
      };

      colors.hints.end = {
        background = hex.subtext0;
        foreground = hex.base;
      };

      colors.hints.start = {
        background = hex.yellow;
        foreground = hex.base;
      };

      colors.normal = {
        black = hex.surface1;
        blue = hex.blue;
        cyan = hex.teal;
        green = hex.green;
        magenta = hex.pink;
        red = hex.red;
        white = hex.subtext1;
        yellow = hex.yellow;
      };

      colors.primary = {
        background = hex.crust;
        bright_foreground = hex.text;
        dim_foreground = hex.text;
        foreground = hex.text;
      };

      colors.search.focused_match = {
        background = hex.green;
        foreground = hex.base;
      };

      # colors.search.footer_bar = {
      #     background = hex.subtext0;
      #     foreground = hex.base;
      # };

      colors.search.matches = {
        background = hex.subtext0;
        foreground = hex.base;
      };

      colors.selection = {
        background = hex.lavender;
        text = hex.crust;
      };

      colors.vi_mode_cursor = {
        cursor = hex.lavender;
        text = hex.base;
      };

      cursor = {
        style = "Beam";
      };

      env = {
        # TERM = "xterm-256color"
        # TERM = "alacritty"
        TERM = "alacritty-direct";
      };

      font = {
        size = 13;
      };

      font.glyph_offset = {
        x = 0;
        y = 0;
      };

      font = {
        normal = {
          # family = "NotoSansM Nerd Font";
          family = "NotoSansM Nerd Font";
          style = "Regular";
        };
        italic = {
          family = "NotoSansM Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "NotoSansM Nerd Font";
          style = "Bold";
        };
        bold_italic = {
          family = "NotoSansM Nerd Font";
          style = "Bold";
        };
      };

      # [font.normal]
      # family = "Tamzen"
      # [font.italic]
      # family = "Tamzen"
      # [font.bold]
      # family = "Tamzen"
      # [font.bold_italic]
      # family = "Tamzen"

      # [font.normal]
      # family = "JetBrains Mono Nerd Font"
      # style = "Regular"
      # [font.italic]
      # family = "JetBrains Mono Nerd Font"
      # style = "Italic"
      # [font.bold]
      # family = "JetBrains Mono Nerd Font"
      # style = "Bold"
      # [font.bold_italic]
      # family = "JetBrains Mono Nerd Font"
      # style = "Bold Italic"

      # [font.normal]
      # family = "Monaspace Neon"
      # style = "Regular"
      # [font.italic]
      # family = "Monaspace Krypton"
      # style = "Italic"
      # [font.bold]
      # family = "Monaspace Neon"
      # style = "Bold"
      # [font.bold_italic]
      # family = "Monaspace Neon"
      # style = "Bold Italic"

      font.offset = {
        x = 0;
        y = 0;
      };

      keyboard.bindings = [

        {
          action = "Paste";
          key = "V";
          mods = "Control|Shift";
        }
        {
          action = "Copy";
          key = "C";
          mods = "Control|Shift";
        }
        {
          action = "ResetFontSize";
          key = "Key0";
          mods = "Control";
        }
        {
          action = "IncreaseFontSize";
          key = "Equals";
          mods = "Control";
        }
        {
          action = "IncreaseFontSize";
          key = "Plus";
          mods = "Control";
        }
        {
          action = "DecreaseFontSize";
          key = "Minus";
          mods = "Control";
        }
        {
          chars = ''\f'';
          key = "L";
          mods = "Control";
        }
        {
          chars = ''\u0017'';
          key = "Back";
          mods = "Control";
        }

      ];

      # [[keyboard.bindings]]
      # chars = "\x17"
      # key = "Back"
      # mods = "Control"

      mouse = {
        hide_when_typing = false;
      };

      #[scrolling]
      #auto_scroll = false
      #history = 10000

      window = {
        dynamic_padding = true;
        opacity = 1.0;
        startup_mode = "Windowed";
        title = "Alacritty";
      };

      window.class = {
        general = "Alacritty";
        instance = "Alacritty";
      };

      window.dimensions = {
        columns = 0;
        lines = 0;
      };

      window.padding = {
        x = 4;
        y = 4;
      };

    };
  };

}
