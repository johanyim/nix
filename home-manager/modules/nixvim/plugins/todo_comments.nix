{
  lib,
  baseColors,
  ...
}:

let
  hex = lib.mapAttrs (name: color: "#${color}") baseColors;

  user_defined_keywords = {
    FIX = {
      icon = " ";
      color = hex.red;
      alt = [
        "FIXME"
        "BUG"
        "FIXIT"
        "ISSUE"
      ];
    };

    TODO = {
      icon = " ";
      color = hex.flamingo;
    };
    HACK = {
      icon = " ";
      color = hex.peach;
      alt = [ "WTF" ];
    };
    ERROR = {
      icon = " ";
      color = hex.red;
    };
    WARN = {
      icon = " ";
      color = hex.yellow;
      alt = [
        "WARNING"
        "XXX"
      ];
    };
    PERF = {
      icon = "󰅒 ";
      color = hex.pink;
      alt = [
        "OPTIM"
        "PERFORMANCE"
        "OPTIMIZE"
      ];
    };
    NOTE = {
      icon = " ";
      color = hex.lavender;
      alt = [ "INFO" ];
    };
    # DEBUG = {
    #
    # };
    IDEA = {
      icon = "󰛨 ";
      color = hex.yellow;
      alt = [ "FUTURE" ];
    };

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
        color = hex.rosewater;
        alt = [ "${toString i}" ];
      };
    }) (builtins.length icons)
  );

  keywords = user_defined_keywords // steps;

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

      highlight = {
        multiline = true;
      };

    };

  };

}
