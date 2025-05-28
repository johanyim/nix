{ pkgs }:
pkgs.writeShellScriptBin "port_killer" ''
  selection=$(
    ${pkgs.lsof}/bin/lsof -iTCP -sTCP:LISTEN -Pn | 
    awk 'NR>1 {print $9"\t"$1"\t"$2}' | 
    uniq | 
    ${pkgs.rofi}/bin/rofi -dmenu -p "kill: "
  )

  if [[ -z $selection ]]; then
    exit 0
  fi

  # listener=$(echo "$selection" | awk -F'\t' '{ print $1 }')
  # pname=$(echo "$selection" | awk -F'\t' '{ print $2 }')
  # pid=$(echo "$selection" | awk -F'\t' '{ print $3 }')


  IFS=$'\t' read -r listener pname pid <<< "$selection"

  kill "$pid" || kill -9 "$pid" && ${pkgs.libnotify}/bin/notify-send "$pname (PID: $pid) listening on $listener killed successfully"
''
