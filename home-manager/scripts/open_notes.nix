{ pkgs }:
pkgs.writeShellScriptBin "open_notes" ''

  options=$(ls "$HOME/notes")

  echo "$options" | ${pkgs.rofi}/bin/rofi -dmenu

  # ${pkgs.alacritty}/bin/alacritty -e nvim ~/notes/
''
