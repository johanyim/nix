{
  lib,
  baseColors,
  ...
}:
let
  hex = lib.mapAttrs (name: color: "#${color}") baseColors;

  # TODO: use hex.color for these
  user_defined_keywords = {
    FIX = {
      icon = " ";
      color = "#f38ba8";
      alt = [
        "FIXME"
        "BUG"
        "FIXIT"
        "ISSUE"
      ];
    };

    ERROR = {
      icon = " ";
      color = "#f38ba8";
    };
    TODO = {
      icon = " ";
      color = "#f2cdcd";
    };
    HACK = {
      icon = " ";
      color = "#fab387";
      alt = [ "WTF" ];
    };
    WARN = {
      icon = " ";
      color = "#f9e2af";
      alt = [
        "WARNING"
        "XXX"
      ];
    };
    PERF = {
      icon = "󰅒 ";
      color = "#f5c2e7";
      alt = [
        "OPTIM"
        "PERFORMANCE"
        "OPTIMIZE"
      ];
    };
    NOTE = {
      icon = " ";
      color = "#b4befe";
      alt = [ "INFO" ];
    };
    # DEBUG = {
    #
    # };
    TEST = {
      icon = " ";
      color = "#94e2d5";
      alt = [
        "TESTING"
        "PASSED"
        "FAILED"
      ];
    };
    IDEA = {
      icon = "󰛨 ";
      color = "#f9e2af";
      alt = [ "FUTURE" ];
    };

    # "STEP0" = {
    #   icon = "󰎡 ";
    #   color = hex.rosewater;
    #   alt = [
    #   ];
    # };
  };

  icons = [
    "󰎡 "
    "󰎤 "
    "󰎧 "
    "󰎪 "
    "󰎭 "
    "󰎱 "
    "󰎳 "
    "󰎶 "
    "󰎹 "
    "󰎼 "
    "󰽽 "
  ];
  steps = builtins.listToAttrs (
    builtins.genList (i: {
      name = "STEP${toString i}";
      value = {
        icon = builtins.elemAt icons i;
        color = hex.text;
        alt = [ "${toString i}" ];
      };
    }) (builtins.length icons)
  );

  keywords = steps;

in
{
  programs.nixvim.plugins.todo-comments = {
    enable = true;

    keymaps.todoTelescope = {
      key = "<Space>t";
      mode = [ "n" ];
      options = {
        silent = true;
        desc = "Todo-comments: Open telescope";
      };
    };
    settings = {

      inherit keywords;

      # FIX: fix this
      # this is a fix
      # TODO: this
      #  this is a todo
      # HACK:
      # WARN:
      # PERF:
      # NOTE:
      # TEST:
      # IDEA:

      highlight = {
        multiline = true;
      };

    };

  };

}
