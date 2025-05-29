{ pkgs, ... }:
pkgs.writeShellScriptBin "screenshot" ''
  # ${pkgs.git}/bin/git restore --staged "$HOME/nix/home-manager"
  #
  # # commit with message
  # if [ $? -eq 0 ]; then
  # fi


  area=$(${pkgs.slurp}/bin/slurp)

  if [ $? -ne 0 ]; then
    ${pkgs.libnotify}/bin/notify-send "Screenshot cancelled or failed"
    exit 1
  fi

  name="$(date +'%Y-%m-%d_%H-%M-%S').png"

  ${pkgs.grim}/bin/grim -g "$area" "$HOME/Pictures/$name" |  ${pkgs.wl-clipboard}/bin/wl-copy

  if [ $? -eq 0 ]; then
    ${pkgs.libnotify}/bin/notify-send "Screenshot copied and saved to $name"
  else
    ${pkgs.libnotify}/bin/notify-send "Screenshot failed"
  fi


''
