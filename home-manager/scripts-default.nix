# { pkgs, ... }:
# # [
# #   (import ./hms.nix { inherit pkgs; })
# #   (import ./nrs.nix { inherit pkgs; })
# #   (import ./screenshot.nix { inherit pkgs; })
# #   (import ./screenshot-edit.nix { inherit pkgs; })
# # ]
#
# let 
#   files = builtins.attrNames (builtins.readDir ./.);
#
#   nix
#
# in
#   {scripts}
#
