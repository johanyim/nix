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
      emmet_language_server = {
        enable = true;
        filetypes = [
          "svelte"
          "html"
          "jsx"
        ];
        # settings = {
        #   formatting = {
        #     command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
        #   };
        # };
      };
    };
  };

}
