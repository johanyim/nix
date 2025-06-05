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
      font = "Departure Mono 16";

      "urgency=low" = {
        background-color = "${hex.mantle}";
        border-color = "${hex.green}";
      };

      "urgency=normal" = {
        background-color = "${hex.mantle}";
        border-color = "${hex.lavender}";
      };

      "urgency=critical" = {
        border-color = "${hex.red}";
        background-color = "${hex.mantle}";
      };
    };
  };

}
