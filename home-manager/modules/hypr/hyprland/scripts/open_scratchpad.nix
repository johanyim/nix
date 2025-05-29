{ pkgs, ... }:
pkgs.writeShellScriptBin "open_scratchpad" ''

  ${pkgs.alacritty}/bin/alacritty -e $EDITOR "$HOME/notes/scratchpad.md"

''
