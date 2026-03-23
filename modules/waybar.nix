{ config, pkgs , ...}

{
  programs.waybar = {
    enable = true;

    settings = {
      position = "top";
      layer = "top";
      monitor = "eDP-1";

      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "network" "pulseaudio" "tray" ];

      clock = {
        format = "%F %H:%M:%S";
      };
    };
  }
}
