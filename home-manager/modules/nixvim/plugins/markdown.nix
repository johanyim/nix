{ ... }:
{
  programs.nixvim.plugins.render-markdown = {
    enable = true;
    settings = {
      heading = {
        enabled = true;
        sign = true;
        position = "overlay";
        icons = [
          "󰲡 "
          "󰲣 "
          "󰲥 "
          "󰲧 "
          "󰲩 "
          "󰲫 "
        ];
        # signs = { "󰫎 " };
        width = [
          "block"
          "block"
          "block"
          "block"
          "block"
          "block"
        ];
        left_pad = 0;
        right_pad = 0;
        min_width = 0;
        # -- border = false;
        # -- border_prefix = false;
        # -- above = "▄";
        # -- below = "▀";
        backgrounds = [
          "RenderMarkdownH1Bg"
          "RenderMarkdownH2Bg"
          "RenderMarkdownH3Bg"
          "RenderMarkdownH4Bg"
          "RenderMarkdownH5Bg"
          "RenderMarkdownH6Bg"
        ];
        foregrounds = [
          "RenderMarkdownH1"
          "RenderMarkdownH2"
          "RenderMarkdownH3"
          "RenderMarkdownH4"
          "RenderMarkdownH5"
          "RenderMarkdownH6"
        ];
      };
      pipe_table = {
        enabled = true;
        preset = "none";
        style = "normal";
        cell = "padded";
        alignment_indicator = "━";
        border = [

          "┌"
          "┬"
          "┐"
          "├"
          "┼"
          "┤"
          "└"
          "┴"
          "┘"
          "│"
          "─"
        ];
        head = "RenderMarkdownTableHead";
        row = "RenderMarkdownTableRow";
        filler = "RenderMarkdownTableFill";
      };

      checkbox = {
        enabled = true;
        position = "overlay";
        unchecked = {
          icon = "󰄱";
          highlight = "RenderMarkdownUnchecked";
        };
        checked = {
          icon = "󰱒";
          highlight = "RenderMarkdownChecked";
        };
        # -- custom = {
        # -- 	todo = { raw = "[-]"; rendered = "󰥔", highlight = "RenderMarkdownTodo" },
        # -- };
      };

    };
  };

}
