{ lib, baseColors, ... }:
let
  hex = lib.mapAttrs (name: hex: "#${hex}") baseColors;
in
{
  services.mako = {
    enable = true;
    anchor = "bottom-right";
    backgroundColor = "${hex.mantle}80";
    borderColor = "${hex.lavender}80";
    borderSize = 2;
    borderRadius = 8;
    margin = "8";
    width = 400;
    height = 200;
    defaultTimeout = 20000;
    font = "Departure Mono 12";
  };

  services.mako.extraConfig = ''
    outer-margin=8,0

  '';
}
