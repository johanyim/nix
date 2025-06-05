{
  self,
  pkgs,
  lib,
  baseColors,
  ...
}:

let
  rgb = lib.mapAttrs (name: hex: "rgb(${hex})") baseColors;
  screenshot = (import ./scripts/screenshot.nix { inherit pkgs; });
  screenshot_edit = (import ./scripts/screenshot_edit.nix { inherit pkgs; });
  logout_menu = (import ./scripts/logout_menu.nix { inherit pkgs baseColors lib; });
  open_notes = (import ./scripts/open_notes.nix { inherit pkgs; });
  open_scratchpad = (import ./scripts/open_scratchpad.nix { inherit pkgs; });
  change_wallpaper = (import ./scripts/change_wallpaper.nix { inherit pkgs self; });
in
{

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;

    xwayland.enable = true;

    settings = {
      exec-once = [ "waybar" ];
      env = [
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
      ];

      monitor = [ "eDP-1, 1920x1080@60, 0x0, 1.0" ];

      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$browser" = "firefox";
      "$menu" = "rofi";

      general = {
        border_size = 2;
        "col.active_border" = rgb.overlay0;
        "col.inactive_border" = rgb.surface0;
        gaps_out = 8;
        gaps_in = 4;
        layout = "master";
      };

      master = {
        new_on_top = false;
        new_status = "master";
        special_scale_factor = 0.95;
      };

      animations = {
        enabled = false;
        first_launch_animation = false;
      };

      animation = [
        "workspaces, 0"
        "windows, 0"
        "fade, 0"
        "border, 0"
      ];

      decoration = {
        # rounding = 8;
        rounding = 0;

        shadow = {
          enabled = false;
        };

        # inactive_opacity = 0.7;

      };

      input = {
        kb_options = "caps:swapescape";
        touchpad = {
          tap-to-click = false;
        };

        focus_on_close = 1;
      };

      bind = [
        "$mod CTRL SHIFT, Q, exit,"
        "$mod SHIFT, return, exec, $terminal"
        "$mod SHIFT, C, killactive,"
        "$mod, a, exec, $browser"
        "$mod, p, exec, $menu -show drun"
        "$mod, v, togglefloating"
        "$mod, f, fullscreen"

        "$mod, TAB, workspace, previous"

        # toggle bar
        "$mod, B, exec, killall -SIGUSR1 .waybar-wrapped || waybar"

        # screenshot
        "$mod SHIFT, S, exec, ${screenshot}/bin/screenshot"
        "$mod CTRL SHIFT, S, exec, ${screenshot_edit}/bin/screenshot-edit"

        # custom functions
        "$mod, backslash, exec, ${logout_menu}/bin/logout-menu"
        "$mod, n, exec, ${open_notes}/bin/open_notes"
        "$mod, s, exec, ${open_scratchpad}/bin/open_scratchpad"
        "$mod SHIFT, w, exec, ${change_wallpaper}/bin/change_wallpaper"

        "$mod, 0, togglespecialworkspace"
        "$mod SHIFT, 0, movetoworkspace, special"

        "$mod, k, layoutmsg, cycleprev"
        "$mod, j, layoutmsg, cyclenext"
        "$mod, l, movefocus, r"
        "$mod, h, layoutmsg, focusmaster"

        "$mod SHIFT, k, layoutmsg, swapprev"
        "$mod SHIFT, j, layoutmsg, swapnext"
        "$mod SHIFT, l, layoutmsg, swapwithmaster"
        "$mod SHIFT, h, layoutmsg, swapwithmaster"

        "$mod CTRL SHIFT, l, layoutmsg, mfact +0.05"
        "$mod CTRL SHIFT, h, layoutmsg, mfact -0.05"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"

        ",XF86AudioLowerVolume, exec, pactl -- set-sink-volume 0 -5%"
        ",XF86AudioRaiseVolume, exec, pactl -- set-sink-volume 0 +5%"
        ",XF86AudioMute, exec, pactl -- set-sink-mute 0 toggle"
        ",XF86AudioMicMute, exec, pactl -- set-source-mute 0 toggle"
        ",XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        ",XF86MonBrightnessUp, exec, brightnessctl s +5%"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      binds = {
        allow_workspace_cycles = true;
        workspace_center_on = 1;
      };

      misc = {
        disable_hyprland_logo = true;
        middle_click_paste = false;
        new_window_takes_over_fullscreen = 1;
        enable_swallow = true;
        focus_on_activate = true;
      };

      cursor = {
        warp_on_change_workspace = 1;
        # warp_on_toggle_special = 1;
      };

      windowrule = [
        "float, class:floating"
      ];
    };
  };

}
