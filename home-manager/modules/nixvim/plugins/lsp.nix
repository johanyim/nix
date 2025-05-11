{ pkgs, lib, ... }:

{
  programs.nixvim.plugins.lsp-format.enable = true;

  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;
    servers = {
      nixd = {
        enable = true;
        filetypes = [ "nix" ];
        settings = {
          formatting = {
            command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
          };
        };
      };
    };
  };

}
