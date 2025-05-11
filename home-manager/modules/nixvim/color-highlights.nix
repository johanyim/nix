{
  lib,
  baseColors,
  ...
}:
let
  hex = lib.mapAttrs (name: color: "#${color}") baseColors;
in
{
  programs.nixvim.extraConfigLua = # lua
    ''
      local light_colors = {
        rosewater = "${hex.rosewater}",
        flamingo = "${hex.flamingo}",
        pink = "${hex.pink}",
        mauve = "${hex.mauve}",
        red = "${hex.red}",
        maroon = "${hex.maroon}",
        peach = "${hex.peach}",
        yellow = "${hex.yellow}",
        green = "${hex.green}",
        teal = "${hex.teal}",
        sky = "${hex.sky}",
        sapphire = "${hex.sapphire}",
        blue = "${hex.blue}",
        lavender = "${hex.lavender}",
        text = "${hex.text}",
        subtext1 = "${hex.subtext1}",
        subtext0 = "${hex.subtext0}",
        overlay2 = "${hex.overlay2}",
        overlay1 = "${hex.overlay1}",
      }

      local dark_colors =  {
        overlay0 = "${hex.overlay0}",
        surface2 = "${hex.surface2}",
        surface1 = "${hex.surface1}",
        surface0 = "${hex.surface0}",
        base = "${hex.base}",
        mantle = "${hex.mantle}",
        crust = "${hex.crust}",
      };

      for name, hex in pairs(light_colors) do
        local group = "Catppuccin_" .. name
        vim.cmd(string.format("highlight %s guibg=%s guifg=#000000", group, hex))
        vim.fn.matchadd(group, "\\<" .. name .. "\\>")
      end

      for name, hex in pairs(dark_colors) do
        local group = "Catppuccin_" .. name
        vim.cmd(string.format("highlight %s guibg=%s guifg=#FFFFFF", group, hex))
        vim.fn.matchadd(group, "\\<" .. name .. "\\>")
      end
    '';
}
