{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      # nerd-fonts.noto-fonts
      nerd-fonts.departure-mono
      nerd-fonts.noto
      # nerdfonts
      noto-fonts
      departure-mono
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "Noto Sans Mono" ];
      };
    };
  };

}
