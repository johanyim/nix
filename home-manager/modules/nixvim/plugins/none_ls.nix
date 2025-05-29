{ ... }:
{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources = {
      formatting = {
        shfmt.enable = true;
        rustywind.enable = true;
      };
      code_actions = {
        statix.enable = true;
      };

      diagnostics = {
      };
    };
  };

}
