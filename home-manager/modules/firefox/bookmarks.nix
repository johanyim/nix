{ ... }:
{
  programs.firefox.profiles.default.bookmarks = {
    force = true;
    settings = [
      {
        name = "Home Manager Options";
        keyword = "hm";
        url = "https://home-manager-options.extranix.com/";
      }
      {
        name = "Johan Yim";
        keyword = "johan";
        url = "https://www.johanyim.com";
      }
      {
        name = "NixOS Options";
        keyword = "nix";
        url = "https://search.nixos.org/options";
      }

      {
        name = "NixVim";
        keyword = "nvim";
        url = "https://nix-community.github.io/nixvim/index.html";
      }

      {
        name = "NixVim Search";
        keyword = "nixvim";
        url = "https://nix-community.github.io/nixvim/search/";
      }

      {
        name = "MyAnimeList";
        keyword = "mal";
        url = "https://myanimelist.net/";
      }

      {
        name = "Nyaa.si";
        keyword = "nya";
        url = "https://nyaa.si/";
      }

      {
        name = "ChatGPT";
        keyword = "chatgpt";
        url = "https://chatgpt.com/";
      }
    ];
  };
}
