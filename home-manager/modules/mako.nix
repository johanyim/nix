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
      border-size = 2;
      border-radius = 8;
      margin = "8";
      width = 500;
      height = 400;
      font = "Departure Mono 14";

      "urgency=low" = {
        default-timeout = 5000;
        background-color = "${hex.mantle}80";
        border-color = "${hex.green}80";
      };

      "urgency=normal" = {
        default-timeout = 20000;
        background-color = "${hex.mantle}80";
        border-color = "${hex.lavender}80";
      };

      "urgency=critical" = {
        default-timeout = 60000;
        border-color = "${hex.red}";
        background-color = "${hex.mantle}";
      };
    };
  };

}
