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
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

}
