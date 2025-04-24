{ pkgs, baseColors, ... }:
{

  console = {
    colors = with baseColors; [
      crust
      red
      green
      yellow
      blue
      mauve
      teal
      subtext0
      surface0
      red
      green
      yellow
      blue
      mauve
      teal
      text
    ];
    earlySetup = true;
    useXkbConfig = true;
  };

}
