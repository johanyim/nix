{ pkgs, ... }:
pkgs.writeShellScriptBin "notes" ''
  nvim $HOME/notes/scratchpad.md
''
