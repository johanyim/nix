{
  lib,
  pkgs,
  baseColors,
  ...
}:
let
  rgb = lib.mapAttrs (name: hex: "#${hex}") baseColors;
in
{

  programs.tmux = {
    enable = true;

    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    shortcut = "s";
    keyMode = "vi";
    escapeTime = 0;

  };

}
