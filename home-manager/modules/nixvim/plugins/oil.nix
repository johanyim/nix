{ ... }:
{
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      columns = [
        "permissions"
        "size"
        "icon"
      ];

      experimental_watch_for_changes = true;
      view_options = {
        show_hidden = true;
      };

    };
  };
}
