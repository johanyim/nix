{ self, ... }:
let
  # wallpaper = self + "/wallpaper/pixel-galaxy.png";
  # wallpaper = self + "/wallpaper/jellyfish.jpg";
  wallpaper = self + "/wallpaper/pixel-galaxy-darkened.png";
  display = "eDP-1";
in
{

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ wallpaper ];
      wallpaper = [
        "${display},${wallpaper}"
      ];
    };
  };
}
