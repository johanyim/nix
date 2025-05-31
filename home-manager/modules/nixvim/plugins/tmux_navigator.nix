{ ... }:
{
  programs.nixvim.plugins.tmux-navigator = {
    enable = true;
    settings = {
      disable_when_zoomed = 1;
    };
    keymaps = [
      {
        action = "left";
        key = "<A-h>";
      }
      {
        action = "down";
        key = "<A-j>";
      }
      {
        action = "up";
        key = "<A-k>";
      }
      {
        action = "right";
        key = "<A-l>";
      }
    ];
  };
}
