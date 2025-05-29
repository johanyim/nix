{ pkgs, ... }:
pkgs.writeShellScriptBin "open_scratchpad" ''
  INSTANCE_NAME="scratchpad"
  PID_PATH="/tmp/$INSTANCE_NAME.pid"

  if [[ -f $PID_PATH ]]; then
  	PID=$(cat $PID_PATH)

  	rm -f "$PID"
  	kill "$PID" >/dev/null 2>&1 && exit 0
  fi

  ${pkgs.alacritty}/bin/alacritty --title $INSTANCE_NAME --class "floating" --command "$EDITOR" "$HOME/notes/scratchpad.md" &
  echo $! >"$PID_PATH"

''
