{ pkgs }:
pkgs.writeShellScriptBin "open_notes" ''

  options=$(ls -1 "$HOME/notes")
  options="Scratchpad
  Create daily note
  $options
  "

  selection=$(echo "$options" | ${pkgs.rofi}/bin/rofi -dmenu -i)

  if [[ -z $selection ]]; then
    exit 0
  fi 

  case "$selection" in
    "Create daily note")
    selection=$(date --i)
    ;;
  "Scratchpad")
    selection="scratchpad.md"
    ;;
  *) ;;
  esac


  ${pkgs.alacritty}/bin/alacritty -e nvim "$HOME/notes/$selection"
''
