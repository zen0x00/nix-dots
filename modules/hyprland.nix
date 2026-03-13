{ config, pkgs, ... }:

let
  terminal = "kitty";
  fileManager = "thunar";
  browser = "brave";
  mainMod = "SUPER";
in

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {

      monitor = [
        "monitor=eDP-1,1920x1080@144,0x0,1"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        "ELECTRON_ENABLE_WAYLAND,1"
        "PATH,$HOME/.local/bin:/usr/local/bin:/usr/bin"
      ];

      exec-once = [
        "awww-daemon"
        "hyprctl setcursor sunset-cursors 24"
        "hypridle"
        "hyprpolkitagent"
        "openrgb -p red"
        "swaync"
        "swayosd-server"
      ];

      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =
          follow_mouse = 1
          accel_profile = flat
          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
          touchpad {
              natural_scroll = false
          }
      }

      general = {
        gaps_in = 5
        gaps_out = 10
        border_size = 2
        col.active_border = rgb(cdd6f4)
        col.inactive_border = rgba(595959aa)
        resize_on_border = false
        allow_tearing = false
        layout = dwindle
      };

      decoration = {
        rounding = 0
        rounding_power = 4
        active_opacity = 0.875
        inactive_opacity = 0.6
        
        shadow {
            enabled = true
            range = 28
            render_power = 3
            color = rgba(1a1b2699)
            scale = 1.0
        }

        blur {
            enabled = true
            size = 3
            passes = 4
            ignore_opacity = true
            noise = 0.0117
            contrast = 0.8916
            xray = false
            new_optimizations = true
            special = false
        }
      };

      animations = {
        enabled = true;
        bezier = overshot, 0.05, 0.9, 0.1, 1.05
        bezier = smoothOut, 0.36, 0, 0.66, -0.56
        bezier = smoothIn, 0.25, 1, 0.5, 1

        animation = windows, 1, 3, overshot, slide
        animation = windowsOut, 1, 3, smoothOut, slide
        animation = windowsMove, 1, 3, default
        animation = border, 1, 3, default
        animation = fade, 1, 3, smoothIn
        animation = fadeDim, 1, 3, smoothIn
        animation = workspaces, 1, 3, default
      };

      dwindle = {
        pseudotile = true
        force_split = 2
        preserve_split = true
      };

      scrolling {
        fullscreen_on_one_column = true
        column_width = 1
        focus_fit_method = 1
        follow_focus = true
      };

      master = {
        allow_small_split = true
        new_status = master
        new_on_top = off
        new_on_active = before
        drop_at_cursor = on
        always_keep_position = off
      };

      misc = {
        force_default_wallpaper = -1
        disable_hyprland_logo = false
      };

      bind = [
        "${mainMod}, RETURN, exec, uwsm-app -- ${terminal}"
        "${mainMod}, SPACE, exec, uwsm-app -- zen0x-launch-walker"
        "${mainMod} SHIFT, SPACE, exec, uwsm-app -- zen0x-menu"
        "${mainMod}, B, exec, uwsm-app -- ${browser}"
        "${mainMod}, W, killactive"
        "${mainMod} SHIFT, M, exit"
        "${mainMod}, E, exec, uwsm-app -- ${fileManager}"
        "${mainMod} SHIFT, V, togglefloating"
        "${mainMod} SHIFT, F, fullscreen"

        "${mainMod}, left, movefocus, l"
        "${mainMod}, right, movefocus, r"
        "${mainMod}, up, movefocus, u"
        "${mainMod}, down, movefocus, d"

        "${mainMod}, 1, workspace, 1"
        "${mainMod}, 2, workspace, 2"
        "${mainMod}, 3, workspace, 3"
        "${mainMod}, 4, workspace, 4"
        "${mainMod}, 5, workspace, 5"
        "${mainMod}, 6, workspace, 6"
        "${mainMod}, 7, workspace, 7"
        "${mainMod}, 8, workspace, 8"
        "${mainMod}, 9, workspace, 9"
        "${mainMod}, 0, workspace, 10"

        "${mainMod} SHIFT, 1, movetoworkspace, 1"
        "${mainMod} SHIFT, 2, movetoworkspace, 2"
        "${mainMod} SHIFT, 3, movetoworkspace, 3"
        "${mainMod} SHIFT, 4, movetoworkspace, 4"
        "${mainMod} SHIFT, 5, movetoworkspace, 5"
        "${mainMod} SHIFT, 6, movetoworkspace, 6"
        "${mainMod} SHIFT, 7, movetoworkspace, 7"
        "${mainMod} SHIFT, 8, movetoworkspace, 8"
        "${mainMod} SHIFT, 9, movetoworkspace, 9"
        "${mainMod} SHIFT, 0, movetoworkspace, 10"

        "${mainMod}, R, submap, resize"

        "SUPER SHIFT, H, movewindow, l"
        "SUPER SHIFT, L, movewindow, r"
        "SUPER SHIFT, K, movewindow, u"
        "SUPER SHIFT, J, movewindow, d"

        "${mainMod} SHIFT, S, exec, hyprshot -m region --raw | satty --filename -"
        "${mainMod} SHIFT, ESCAPE, exec, pgrep -x wlogout || wlogout -b 5"
        "${mainMod} SHIFT, C, exec, code"
        "${mainMod} SHIFT, W, exec, zen0x-theme-reload"

        "${mainMod}, mouse_down, workspace, e+1"
        "${mainMod}, mouse_up, workspace, e-1"

        ", XF86AudioRaiseVolume, exec, swayosd-client --volume raise"
        ", XF86AudioLowerVolume, exec, swayosd-client --volume lower"
        ", XF86AudioMute, exec, swayosd-client --volume mute"
      ];

      bindd = [
        "ALT, TAB, workspace, e+1"
        "SUPER SHIFT, TAB, workspace, e-1"
        "SUPER CTRL, TAB, workspace, previous"
      ];

      binde = [
        ", right, resizeactive, 10 0"
        ", left, resizeactive, -10 0"
        ", up, resizeactive, 0 -10"
        ", down, resizeactive, 0 10"
      ];

      submap = [
        "resize"
        "reset"
      ];

      windowrule = [
        # Float LocalSend and fzf file picker
        "float on, match:class (Share|localsend)"
        "center on, match:class (Share|localsend)"
        "float on, match:class steam"
        "center on, match:class steam, match:title Steam"
        "tag -default-opacity, match:class steam.*"
        "opacity 1 1, match:class steam.*"
        "size 1100 700, match:class steam, match:title Steam"
        "size 460 800, match:class steam, match:title Friends List"
        "idle_inhibit fullscreen, match:class steam"

        # Floating windows
        "float on, match:tag floating-window"
        "center on, match:tag floating-window"
        "size 875 600, match:tag floating-window"

        "tag +floating-window, match:class (org.zen0x.bluetui|org.zen0x.impala|org.zen0x.wiremix|org.zen0x.btop|org.zen0x.terminal|org.zen0x.bash|org.gnome.NautilusPreviewer|org.gnome.Evince|com.gabm.satty|zen0x|About|TUI.float|imv|mpv)"
        "tag +floating-window, match:class (xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus), match:title ^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)"
        "float on, match:class org.gnome.Calculator"

        # Fullscreen screensaver
        "fullscreen on, match:class org.zen0x.screensaver"
        "float on, match:class org.zen0x.screensaver"
        "animation slide, match:class org.zen0x.screensaver"

        # No transparency on media windows
        "tag -default-opacity, match:class ^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$"
        "opacity 1 1, match:class ^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$"

        # Popped window rounding
        "rounding 8, match:tag pop"

        # Prevent idle while open
        "idle_inhibit always, match:tag noidle"

        # Define terminal tag to style them uniformly
        "tag +terminal, match:class (Alacritty|kitty|com.mitchellh.ghostty)"
        "tag -default-opacity, match:tag terminal"
        "opacity 0.97 0.9, match:tag terminal"
        "suppress_event maximize, match:class .*"

        # Tag all windows for default opacity
        "tag +default-opacity, match:class .*"

        # Fix dragging issues with XWayland
        "no_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin"

        # Apply default opacity
        "opacity 0.97 0.9, match:tag default-opacity"
      ];
    };
  };
}
