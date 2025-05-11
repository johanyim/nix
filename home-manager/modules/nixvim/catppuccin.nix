{
  lib,
  baseColors,
  ...
}:
let
  hex = lib.mapAttrs (name: color: "#${color}") baseColors;
in
{
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {

      disable_underline = true;
      flavour = "mocha";
      integrations = {
        cmp = true;
        gitsigns = true;
        notify = false;
        treesitter = true;
      };
      term_colors = true;
      custom_highlights = {
        Normal = {
          fg = hex.text;
          bg = hex.crust;
        };
        Comment = {
          fg = hex.overlay1;
          style = { };
        };
        CursorLine = {
          bg = hex.mantle;
        };
        NormalNC = {
          fg = hex.text;
          bg = hex.crust;
        };
        NormalFloat = {
          fg = hex.text;
          bg = hex.crust;
        };
        LineNr = {
          fg = hex.surface0;
        };

        DiagnosticVirtualTextError = {
          fg = hex.red;
        };
        DiagnosticVirtualTextWarning = {
          fg = hex.yellow;
        };
        DiagnosticVirtualTextInfo = {
          fg = hex.sapphire;
        };
        DiagnosticVirtualTextHint = {
          fg = hex.teal;
        };

        GhostText = {
          fg = hex.surface1;
        };
        LspInlayHint = {
          fg = hex.surface1;
          bg = "";
        };

      };
    };
  };
}
