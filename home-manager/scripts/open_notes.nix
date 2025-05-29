{ pkgs, inputs, ... }:
pkgs.writeShellScriptBin "open_notes" ''
  options=$(ls -1 "$HOME/notes")
  options="Scratchpad
  Create daily note
  $options
  "

  options="''${options//\.md/}"

  selection=$(echo "$options" | grep -v "scratchpad" | rofi -dmenu -i -p "Notes: ")

  if [[ -z $selection ]]; then
  	exit 0
  fi

  case "$selection" in
  "Create daily note")
  	if [[ -f "$HOME/notes/$(date --i).md" ]]; then
  		${pkgs.alacritty}/bin/alacritty -e nvim "$HOME/notes/$(date --i).md"
  	else
  		${pkgs.alacritty}/bin/alacritty -e nvim -c "put='# $(date --i)'" -c "put=''''" -c "put=''''" -c "normal! 3G" -c 'startinsert' "$HOME/notes/$(date --i).md"
  	fi
  	exit 0
  	;;
  "Scratchpad")
  	selection="scratchpad"
  	;;
  *) ;;
  esac

  ${pkgs.alacritty}/bin/alacritty -e nvim "$HOME/notes/''${selection//\.md/}.md"

''
