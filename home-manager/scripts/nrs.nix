{ pkgs, ... }:
pkgs.writeShellScriptBin "nrs" ''
  # include all but home-manager
  ${pkgs.git}/bin/git --no-pager diff 
  ${pkgs.git}/bin/git add "$HOME/nix"
  ${pkgs.git}/bin/git restore --staged "$HOME/nix/home-manager"

  # nixos-rebuild switch
  sudo nixos-rebuild switch --flake "$HOME/nix"

  # commit with message
  if [ $? -eq 0 ]; then
    GENERATION=$(nix-env --list-generations \
    | grep current \
    | awk '{print $1}')
      ${pkgs.git}/bin/git commit -m "$MESSAGE"


    COMMIT_MESSAGE=$(nix-env --list-generations \
    | grep current \
    | awk '{print "NixOS[" $1 "] at " $2 " " $3}')
      ${pkgs.git}/bin/git commit -m "$MESSAGE"

    
    ${pkgs.git}/bin/git commit -m "$COMMIT_MESSAGE"
    ${pkgs.libnotify}/bin/notify-send "Generation $GENERATION" "NixOS"
  fi

''
