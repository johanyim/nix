{ ... }:
{
  programs.firefox.profiles.default.bookmarks = [
    {
      name = "Home Manager Options";
      tags = [ "nixos" ];
      keyword = "home-manager";
      url = "https://home-manager-options.extranix.com/";
    }
    {
      toolbar = true;
      bookmarks = [
        {
          name = "Johan Yim";
          tags = [
            "johan"
          ];
          url = "https://www.johanyim.com";
        }
        {
          name = "NixOS Options";
          tags = [
            "search"
            "nixpkgs"
            "options"
          ];
          url = "https://search.nixos.org/options";
        }

        {
          name = "Home Manager Options";
          tags = [
            "wiki"
            "nix"
            "home"
            "hm"
            "options"
          ];
          url = "https://home-manager-options.extranix.com/";
        }

        {
          name = "NixVim";
          tags = [
            "nix"
            "neovim"
            "vim"
          ];
          url = "https://nix-community.github.io/nixvim/index.html";
        }

        {
          name = "NixVim Search";
          tags = [
            "nix"
            "neovim"
          ];
          url = "https://nix-community.github.io/nixvim/search/";
        }

        {
          name = "MyAnimeList";
          tags = [
            "mal"
            "anime"
          ];
          url = "https://myanimelist.net/";
        }

      ];
    }
  ];
}
