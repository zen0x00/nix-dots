{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "JetBrainsMono Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      disable_ligatures = "never";
      font_size = 13.0;
      line_height = 1.2;

      background_opacity = 1.0;
      cursor_blink_interval = 0.5;

      window_padding_width = 20;
      hide_window_decorations = "yes";

      scrollbar_handle_opacity = 0;
      scrollback_track_opacity = 0;
      scrollback_track_hover_opacity = 0;

      confirm_os_window_close = 0;
      shell_integration = "enabled";

      sync_to_monitor = "no";

      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty-socket";

      cursor_trail = 1;

      # =========================
      # Colors
      # =========================

      foreground = "#c9d1d9";
      background = "#0f1419";

      selection_foreground = "#0f1419";
      selection_background = "#21262d";

      cursor = "#4da6ff";
      cursor_text_color = "#0f1419";

      url_color = "#4da6ff";

      active_border_color = "#4da6ff";
      inactive_border_color = "#0f1419";

      bell_border_color = "#ff6b6b";
      visual_bell_color = "none";

      wayland_titlebar_color = "#161b22";
      macos_titlebar_color = "#161b22";

      active_tab_foreground = "#c9d1d9";
      active_tab_background = "#0f1419";

      inactive_tab_foreground = "#8b949e";
      inactive_tab_background = "#161b22";

      tab_bar_background = "#161b22";
      tab_bar_margin_color = "none";

      mark1_foreground = "#0f1419";
      mark1_background = "#c9d1d9";

      mark2_foreground = "#0f1419";
      mark2_background = "#4da6ff";

      mark3_foreground = "#0f1419";
      mark3_background = "#39c5cf";

      color0 = "#0f1419";
      color8 = "#6e7681";

      color1 = "#ff6b6b";
      color9 = "#ff6b6b";

      color2 = "#3fb950";
      color10 = "#3fb950";

      color3 = "#d29922";
      color11 = "#d29922";

      color4 = "#4da6ff";
      color12 = "#4da6ff";

      color5 = "#bc8cff";
      color13 = "#bc8cff";

      color6 = "#39c5cf";
      color14 = "#39c5cf";

      color7 = "#c9d1d9";
      color15 = "#c9d1d9";
    };
  };
}
