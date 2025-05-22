{ ... }:
{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };
      formattersByFt = {
        rust = [ "rustfmt" ];
      };
    };
  };

}
