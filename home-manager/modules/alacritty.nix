# { baseColors, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      # dynamic_title = true
      general.live_config_reload = true;
      # unfocused_hollow = true

      colors.indexed_colors = [
        {
          color = "#FAB387";
          index = 16;
        }
        {
          color = "#F5E0DC";
          index = 17;
        }
      ];

      colors.bright = {
        black = "#585B70";
        blue = "#89B4FA";
        cyan = "#94E2D5";
        green = "#A6E3A1";
        magenta = "#F5C2E7";
        red = "#F38BA8";
        white = "#A6ADC8";
        yellow = "#F9E2AF";
      };

      colors.cursor = {
        cursor = "#cdd6f4";
        text = "#1E1E2E";
      };

      colors.dim = {
        black = "#45475A";
        blue = "#89B4FA";
        cyan = "#94E2D5";
        green = "#A6E3A1";
        magenta = "#F5C2E7";
        red = "#F38BA8";
        white = "#BAC2DE";
        yellow = "#F9E2AF";
      };

      colors.hints.end = {
        background = "#A6ADC8";
        foreground = "#1E1E2E";
      };

      colors.hints.start = {
        background = "#F9E2AF";
        foreground = "#1E1E2E";
      };

      colors.normal = {
        black = "#45475A";
        blue = "#89B4FA";
        cyan = "#94E2D5";
        green = "#A6E3A1";
        magenta = "#F5C2E7";
        red = "#F38BA8";
        white = "#BAC2DE";
        yellow = "#F9E2AF";
      };

      colors.primary = {
        background = "#11111B";
        bright_foreground = "#CDD6F4";
        dim_foreground = "#CDD6F4";
        foreground = "#CDD6F4";
      };

      colors.search.focused_match = {
        background = "#A6E3A1";
        foreground = "#1E1E2E";
      };

      # colors.search.footer_bar = {
      #     background = "#A6ADC8";
      #     foreground = "#1E1E2E";
      # };

      colors.search.matches = {
        background = "#A6ADC8";
        foreground = "#1E1E2E";
      };

      colors.selection = {
        background = "#B4BEFE";
        text = "#11111B";
      };

      colors.vi_mode_cursor = {
        cursor = "#B4BEFE";
        text = "#1E1E2E";
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
