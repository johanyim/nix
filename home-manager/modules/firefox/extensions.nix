{
  inputs,
  pkgs,
  ...
}:
{
  programs.firefox.profiles.default.extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
    ublock-origin
    # bitwarden
    # darkreader
    vimium
    # rust-search-extension
    clearurls
    auto-tab-discard

    nyaa-linker
  ];

}
