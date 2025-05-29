{ pkgs }:
pkgs.writeShellScriptBin "open_notes" ''

  options=$(ls "$USER/notes")

  echo "$options" | ${pkgs.rofi}/bin/rofi -dmenu

  # ${pkgs.alacritty}/bin/alacritty -e nvim ~/notes/
''
