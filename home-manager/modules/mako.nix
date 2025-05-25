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
      background-color = "${hex.mantle}80";
      border-color = "${hex.lavender}80";
      border-size = 2;
      border-radius = 8;
      margin = "8";
      width = 400;
      height = 200;
      default-timeout = 20000;
      font = "Departure Mono 12";
    };
  };

}
