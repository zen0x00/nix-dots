{ config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/rofi.nix
    ./modules/waybar.nix
    ./modules/zsh.nix
  ];
  home.username = "aman";
  home.homeDirectory = "/home/aman";
  home.stateVersion = "25.11";
  programs.git = {
    enable = true;
    settings.user.name = " zen0x";
    settings.user.email = "amanchaitany@proton.me";
  };
  programs.zsh.enable = true;
  programs.fzf.enableZshIntegration = true;

  home.packages = with pkgs; [
    afterglow-cursors-recolored
    brave
    nautilus
    rofi
    fcitx5
    hyprpaper
    hypridle
    hyprlock
    hyprpolkitagent
    nwg-look
    kitty
    sass
    sassc
    swww
    vscode
  ];
}
