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
  programs.rofi = {
    enable = true;
    # package = pkgs.rofi-wayland;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    font = "Departure Mono 14";
    location = "center";
  };

  programs.rofi.extraConfig = {
    modi = "drun";
    show-icons = false;
    drun-display-format = "{name}";
    disable-history = false;
    hide-scrollbar = false;
    display-drun = "drun";
    sidebar-mode = false;
  };

  programs.rofi.theme =
    let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
    {

      "*" = {
        crust = mkLiteral "#11111b";
        base = mkLiteral "#1e1e2e";
        surface0 = mkLiteral "#313244";
        overlay0 = mkLiteral "#6c7086";
        text = mkLiteral "#cdd6f4";

        mauve = mkLiteral "#cba6f7";
        red = mkLiteral "#f38ba8";
        peach = mkLiteral "#fab387";
        green = mkLiteral "#a6e3a1";
        lavender = mkLiteral "#b4befe";

        background-color = mkLiteral hex.crust;
      };

      window = {
        height = 600;
        width = 600;

        border = 2;
        border-radius = 8;
        border-color = mkLiteral hex.lavender;
      };

      mainbox = {
        spacing = 0;
        children = map mkLiteral [
          "inputbar"
          "message"
          "listview"
        ];
      };

      inputbar = {
        color = mkLiteral "@text";
        padding = 14;
        background-color = mkLiteral "@crust";
      };

      message = {
        padding = mkLiteral "10";
        background-color = mkLiteral "@overlay0";
      };

      listview = {
        border = mkLiteral "2 2 2 2";
        background-color = mkLiteral "@crust";
        dynamic = mkLiteral "false";
      };

      textbox = {
        text-color = mkLiteral "@text";
        background-color = mkLiteral "inherit";
      };

      error-message = {
        border = mkLiteral "20 20 20 20";
      };

      "entry, prompt, case-indicator" = {

        text-color = mkLiteral "inherit";
      };

      prompt = {
        margin = mkLiteral "0 10 0 0";
      };

      "element.selected.normal" = {
        background-color = mkLiteral "@base";
      };

      "element-text" = {
        margin = mkLiteral "0 10";
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "@text";
      };

      "element-text .active, element-text .urgent" = {
        text-color = mkLiteral "@base";
      };

    };

}
