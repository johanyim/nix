{ ... }:
{
  # options from 'about:config'
  programs.firefox.profiles.default = {
    settings = {
      # drop straight into about:config for best customization speed
      "browser.aboutConfig.showWarning" = false;
      # "browser.startup.homepage" = "about:config";
      "browser.startup.homepage" = "chrome://browser/content/blanktab.html";

      # new tabs no sponsored crap
      "browser.newtabpage.activity-stream.feeds.topsites" = false;

      # configuration based vertical tabs
      "sidebar.verticalTabs" = true;
      "sidebar.position_start" = false; # veritcal tabs on the right

      # it's meant to be an empty list,
      # but an empty string will make the option disappear and return to default
      "sidebar.main.tools" = ''""'';

      # # enable extensions by default on first launch
      # "extensionsAutoDisableScopes" = 0;

      # TODO: need to find out how to get themes installed
      # # theme
      # "exentions.activeThemeID" = ''{8446b178-c865-4f5c-8ccc-1d7887811ae3}'';
      # "browser.theme.content-theme" = 0;
      # "browser.theme.toolbar-theme" = 0;

      # compact mode
      "browser.compactMode.show" = true;
      "browser.uidensity" = 1;

      # bookmarks toolbar hidden
      "browser.toolbars.bookmarks.visibility" = "never";

      # no welcome screen on first installation
      "browser.aboutwelcome.enabled" = false;
      "browser.aboutwelcome.didSeeFinalScreen" = true;

      # new tab goes to blank page
      "browser.newtabpage.enabled" = false;

      # toolbar customization
      "browser.uiCustomization.horizontalTabsBackup" = ''
        {"placements":{"widget-overflow-fixed-list":["developer-button","preferences-button"],"unified-extensions-area":[],"nav-bar":["unified-extensions-button","urlbar-container","stop-reload-button","vertical-spacer","forward-button","back-button","downloads-button","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","ublock0_raymondhill_net-browser-action","sidebar-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["firefox-view-button","tabbrowser-tabs","new-tab-button","alltabs-button"],"vertical-tabs":[],"PersonalToolbar":[]},"seen":["save-to-pocket-button","developer-button","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","ublock0_raymondhill_net-browser-action"],"dirtyAreaCache":["nav-bar","TabsToolbar","vertical-tabs","PersonalToolbar","widget-overflow-fixed-list","toolbar-menubar"],"currentVersion":22,"newElementCount":7}
      '';

      "browser.uiCustomization.horizontalTabstrip" = ''
        ["tabbrowser-tabs","new-tab-button"]
      '';

      "browser.uiCustomization.navBarWhenVerticalTabs" =
        ''["sidebar-button","back-button","forward-button","stop-reload-button","customizableui-special-spring1","vertical-spacer","urlbar-container","customizableui-special-spring2","save-to-pocket-button","downloads-button","fxa-toolbar-menu-button","unified-extensions-button"]'';

      "browser.uiCustomization.state" = ''
        {"placements":{"widget-overflow-fixed-list":["developer-button","preferences-button"],"unified-extensions-area":[],"nav-bar":["back-button","forward-button","stop-reload-button","vertical-spacer","urlbar-container","unified-extensions-button","downloads-button","sidebar-button","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","ublock0_raymondhill_net-browser-action"],"toolbar-menubar":["menubar-items"],"TabsToolbar":[],"vertical-tabs":["tabbrowser-tabs"],"PersonalToolbar":[]},"seen":["save-to-pocket-button","developer-button","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","ublock0_raymondhill_net-browser-action"],"dirtyAreaCache":["nav-bar","TabsToolbar","vertical-tabs","PersonalToolbar","widget-overflow-fixed-list","toolbar-menubar"],"currentVersion":22,"newElementCount":5}
      '';

      # memory efficiency write to memory rather than disk
      "browser.cache.disk.enable" = false;
      "browser.cache.memory.enable" = true;
      "browser.sessionstore.interval" = 1200000; # ~20 minutes, default=15000=15sec

      # limit cache for images
      "image.mem.surfacecache.max_size_kb" = 500000; # ~500mb, default=2GB.

      # the stream buffer segment size used for most network activity
      "network.buffer.cache.size" = 262144; # 262144B=256KB, default, default=32KB (very old TCP/IP stacks)

      "network.buffer.cache.count" = 128;

      "network.http.pacing.requests.burst" = 12; # default=10
      "network.http.pacing.requests.min-parallelism" = 8; # default=6

      "network.http.max-connections" = 1800; # default=900
      # "network.http.max-connections-per-server" = 32; # might not be used anymore, there's no line for it in searchfox (last default might have been 15) https://kb.mozillazine.org/Network.http.max-connections-per-server
      "network.http.max-persistent-connections-per-server" = 12; # default=6
      "network.http.max-urgent-start-excessive-connections-per-host" = 6; # default=3

      "network.ssl_tokens_cache_capacity" = 32768; # more TLS token caching (fast reconnects) // Max connections (can speed things up as well)

      #
      "media.cache_size" = 1024000; # in KB, default = 512000 (500MB)
      "media.memory_cache_max_size" = 65536; # default=8192
      "media.cache_readahead_limit" = 300; # 300 = 5min. Buffer X amount of seconds ahead (when media.mediasource.enabled is set to true [default] this setting might only apply to the built in media player)
      "media.cache_resume_threshold" = 300; # Only continue buffering while the already-loaded buffer is shorter than X seconds

      # smooth scrolling off
      "general.smoothScroll" = false;

      # show all parts of url
      "browser.urlbar.trimURLs" = false;
      "browser.urlbar.trimHttps" = false;

      # disable tab previews
      "browser.tabs.hoverPreview.enabled" = false;

      # increase the speed of processing images
      "image.mem.decode_bytes_at_a_time" = 131072; # 128KB, default=16384=16KB

    };

  };
}
