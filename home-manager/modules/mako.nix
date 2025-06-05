{ lib, baseColors, ... }:
let
  hex = lib.mapAttrs (name: hex: "#${hex}") baseColors;
in
{
  services.mako = {
    enable = true;
    settings = {
      outer-margin = "8,0";
      anchor = "bottom-right";
      border-size = 4;
      border-radius = 8;
      margin = "8";
      width = 500;
      height = 400;
      default-timeout = 20000;
      font = "Departure Mono 12";

      "urgency=low" = {
        background-color = "${hex.mantle}80";
        border-color = "${hex.green}80";
      };

      "urgency=normal" = {
        background-color = "${hex.mantle}80";
        border-color = "${hex.lavender}80";
      };

      "urgency=critical" = {
        border-color = " ${hex.red}80";
        background-color = " ${hex.mantle}";
      };
    };
  };

}
