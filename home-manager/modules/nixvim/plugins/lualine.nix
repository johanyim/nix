{
  lib,
  baseColors,
  ...
}:
let
  hex = lib.mapAttrs (name: color: "#${color}") baseColors;
in
{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
      options.theme = {
        # icons_enabled = true;
        normal = {
          a = {
            fg = hex.blue;
            bg = hex.crust;
          };
          b = {
            fg = hex.mauve;
            bg = hex.crust;
          };
          c = {
            fg = hex.surface1;
            bg = hex.crust;
          };
          x = {
            fg = hex.surface0;
            bg = hex.crust;
          };
          y = {
            fg = hex.surface1;
            bg = hex.crust;
          };
          z = {
            fg = hex.surface1;
            bg = hex.crust;
          };
        };
        insert = {
          a = {
            fg = hex.green;
            bg = hex.crust;
          };
          z = {
            fg = hex.surface1;
            bg = hex.crust;
          };
        };
        visual = {
          a = {
            fg = hex.mauve;
            bg = hex.crust;
          };
          z = {
            fg = hex.surface1;
            bg = hex.crust;
          };
        };
        command = {
          a = {
            fg = hex.peach;
            bg = hex.crust;
          };
          z = {
            fg = hex.surface1;
            bg = hex.crust;
          };
        };
        replace = {
          a = {
            fg = hex.red;
            bg = hex.crust;
          };
          z = {
            fg = hex.surface1;
            bg = hex.crust;
          };
        };
      };
      options.component_separators = {
        left = "";
        right = "";
      };
      options.section_separators = {
        left = "";
        right = "";
      };

      #[
      #{"filetype"
      #{ icon = { align = "right"; }; }
      #]

      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [
          "branch"
          "diagnostics"
        ];
        lualine_c = [ "filename" ];
        lualine_x = [ ];
        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
      inactive_sections = {
        lualine_a = [ ];
        lualine_b = [ ];
        lualine_c = [ "filename" ];
        lualine_x = [ "location" ];
        lualine_y = [ ];
        lualine_z = [ ];
      };
    };

  };
}
