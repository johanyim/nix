{ pkgs, ... }:
{
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    MANPAGER = "nvim -c 'Man!' -";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

}
