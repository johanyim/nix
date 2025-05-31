{ ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    # folding = true;
    settings = {
      ensure_installed = [
        "rust"
        "markdown"
        "nix"
      ];
      highlight.enable = true;
      indent.enable = true;
      auto_install = true;
      sync_install = true;
      plugins.treesitter.nixvimInjections = true;
    };
  };

}
