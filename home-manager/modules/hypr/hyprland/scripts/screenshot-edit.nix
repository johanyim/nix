{ pkgs }:
pkgs.writeShellScriptBin "screenshot-edit" ''
  area=$(${pkgs.slurp}/bin/slurp)

  if [ $? -ne 0 ]; then
    ${pkgs.libnotify}/bin/notify-send "Screenshot cancelled or failed"
    exit 1
  fi

  name="$(date +'%Y-%m-%d_%H-%M-%S').png"

  ${pkgs.grim}/bin/grim -g "$area" - | ${pkgs.swappy}/bin/swappy -f - -o "$HOME/Pictures/$name"

  if [ $? -eq 0 ]; then
    ${pkgs.libnotify}/bin/notify-send "Screenshot saved to $name"
  else
    ${pkgs.libnotify}/bin/notify-send "Screenshot failed"
  fi
''
