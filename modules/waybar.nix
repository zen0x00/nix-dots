{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [
      {
        layer = "top";
        position = "top";
        margin-top = 8;
        margin-bottom = 8;
        height = 38;
        spacing = 12;

        modules-left = [ ];

        modules-center = [
          "clock"
          "mpris"
          "hyprland/workspaces"
          "pulseaudio"
          "network"
          "battery"
        ];

        modules-right = [ ];

        # ---------------- MODULES ----------------

        clock = {
          tooltip = true;
          format = "{:%I:%M %p}";
          tooltip-format = "{:%I:%M %p}";
        };

        mpris = {
          interval = 1;
          format = "{player_icon} {dynamic}";
          format-paused = "{status_icon} <i>{dynamic}</i>";
          on-click-middle = "playerctl play-pause";
          on-click = "playerctl previous";
          on-click-right = "playerctl next";
          scroll-step = 5.0;
          smooth-scrolling-threshold = 1;
          tooltip = true;
          tooltip-format = "{status_icon} {dynamic}\nLeft Click: previous\nMid Click: Pause\nRight Click: Next";

          player-icons = {
            chromium = "";
            default = "";
            firefox = "";
            kdeconnect = "";
            mopidy = "";
            mpv = "󰐹";
            spotify = "";
            vlc = "󰕼";
          };

          status-icons = {
            paused = "󰐎";
            playing = "";
            stopped = "";
          };

          max-length = 20;
        };

        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
          all-outputs = true;
          sort-by-number = true;
          persistent-workspaces = {
            "*" = 5;
          };
        };

        pulseaudio = {
          format = "{icon}";
          on-click = "zen0x-launch-or-focus-tui wiremix";
          on-click-right = "pamixer -t";
          tooltip-format = "Playing at {volume}%";
          scroll-step = 5;

          on-scroll-up = "swayosd-client --output-volume raise";
          on-scroll-down = "swayosd-client --output-volume lower";
          on-click-middle = "swayosd-client --output-volume mute";

          format-muted = "";

          format-icons = {
            headphone = "";
            headset = "";
            default = [
              ""
              ""
              ""
            ];
          };
        };

        network = {
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format = "{icon}";
          format-wifi = "{icon}";
          format-ethernet = "󰀂";
          format-disconnected = "󰤮";

          tooltip-format-wifi = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-ethernet = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-disconnected = "Disconnected";

          interval = 3;
          spacing = 1;

          on-click = "zen0x-launch-wifi";
        };

        battery = {
          states = {
            critical = 15;
          };
          format = "{icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
      }
    ];

    # ---------------- STYLE ----------------

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-size: 14px;
        font-weight: 800;
        border: none;
        border-radius: 0;
        outline: none;
        box-shadow: none;
      }

      window#waybar {
        background-color: transparent;
        color: #c9d1d9;
        border: none;
      }

      .modules-center {
        background-color: rgba(15, 20, 25, 0.95);
        border-radius: 20px;
        padding: 0 16px;
      }

      #clock {
        color: #c9d1d9;
        font-size: 15px;
        font-weight: 900;
        padding-left: 8px;
        padding-right: 8px;
      }

      #mpris {
        color: #6e7681;
        padding-left: 8px;
        padding-right: 12px;
      }

      #workspaces button {
        color: rgba(110, 118, 129, 0.5);
        background-color: transparent;
        margin: 5px 2px;
        padding: 0 8px;
        min-width: 16px;
        border-radius: 16px;
        transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.68);
      }

      #workspaces button:hover {
        color: #c9d1d9;
        background-color: rgba(110, 118, 129, 0.1);
      }

      #workspaces button.active {
        color: #0f1419;
        background-image: linear-gradient(to right, #4da6ff, #8b949e);
        min-width: 30px;
        padding: 0 12px;
      }

      #pulseaudio,
      #network,
      #battery {
        padding: 0 8px;
        font-size: 15px;
      }

      #pulseaudio {
        color: #8b949e;
        padding-left: 12px;
      }

      #network {
        color: #4da6ff;
      }

      #battery {
        color: #6e7681;
        padding-right: 8px;
      }

      #battery.critical {
        color: #ff6b6b;
      }
    '';
  };
}
