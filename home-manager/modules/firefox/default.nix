{ ... }:

{

  imports = [
    ./settings.nix
    ./extensions.nix
    ./bookmarks.nix
  ];
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

    };

  };

}
