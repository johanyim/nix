{ self, ... }:
let
  # wallpaper = self + "/wallpaper/pixel-galaxy.png";
  # wallpaper = self + "/wallpaper/jellyfish.jpg";
  wallpaper = self + "/wallpaper/pixel-galaxy-darkened.png";
in
{

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      preload = [ wallpaper ];
      wallpaper = [
        "eDP-1,${wallpaper}"
      ];
    };
  };
}
