{ pkgs, ... }:
pkgs.writeShellScriptBin "open_scratchpad" ''

  ${pkgs.alacritty}/bin/alacritty -T Scratchpad -e $EDITOR "$HOME/notes/scratchpad.md"

''
