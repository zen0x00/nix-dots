{ config, pkgs, ... }:

{
  wayland.wallpaper.hyprpaper = {
    enable = true;

    settings = {
      monitor = "eDP-1";
      mode = "fill";
      image = "/home/aman/wallpapers/wallpaper.jpg";
    };
  };
}
