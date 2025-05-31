{ ... }:
{
  programs.nixvim.plugins.colorizer = {
    enable = true;
    settings = {
      user_default_options = {
        tailwind = true;
        css = true;
        RGB = true;
        RRGGBB = true;
        RRGGBBAA = true;
      };
    };
  };
}
