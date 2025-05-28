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
    display-drun = "";
    sidebar-mode = false;
  };

  programs.rofi.theme =
    let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
    {

      "*" = {
        background-color = mkLiteral hex.crust;
      };

      window = {
        height = 600;
        width = 600;

        border = 2;
        border-radius = 8;
        border-color = mkLiteral hex.overlay0;
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
        color = mkLiteral hex.text;
        padding = 14;
        background-color = mkLiteral hex.crust;
      };

      message = {
        padding = mkLiteral "10";
        background-color = mkLiteral hex.overlay0;
      };

      listview = {
        border = mkLiteral "2 2 2 2";
        background-color = mkLiteral hex.crust;
        dynamic = mkLiteral "false";
      };

      textbox = {
        text-color = mkLiteral hex.text;
        background-color = mkLiteral "inherit";
      };

      error-message = {
        border = mkLiteral "20 20 20 20";
      };

      "entry, prompt, case-indicator" = {

        text-color = mkLiteral "inherit";
      };

      prompt = {
        margin = mkLiteral "0 0 0 0";
      };

      "element.selected.normal" = {
        background-color = mkLiteral hex.base;
      };

      "element-text" = {
        margin = mkLiteral "0 10";
        background-color = mkLiteral "inherit";
        text-color = mkLiteral hex.text;
        highlight = mkLiteral hex.yellow;
      };

      "element-text .active, element-text .urgent" = {
        text-color = mkLiteral hex.base;
      };

    };

}
