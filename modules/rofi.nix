{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    font = "JetBrains Mono Nerd Font 10";

    extraConfig = {
      modi = "run";
      show-icons = false;
      window-format = "{w} · {c} · {t}";
    };

    theme = ''
      * {
        background:              #0f1419;
        background-alt:          #161b22;
        foreground:              #c9d1d9;
        foreground-alt:          #8b949e;

        selected-background:     #1c2128;
        selected-foreground:     #0f1419;

        active-background:       #4da6ff;
        active-foreground:       #0f1419;

        urgent-background:       #ff6b6b;
        urgent-foreground:       #0f1419;

        border-color:            #0f1419;
        separator-color:         #6e7681;

        inputbar-background:     #0f1419;
        inputbar-foreground:     #c9d1d9;

        element-background:      transparent;
        element-foreground:      #c9d1d9;

        element-selected-background: #1c2128;
        element-selected-foreground: #0f1419;

        element-active-background:   #4da6ff;
        element-active-foreground:   #0f1419;

        element-urgent-background:   #ff6b6b;
        element-urgent-foreground:   #0f1419;
      }

      window {
        transparency: "real";
        location: center;
        anchor: center;
        fullscreen: false;
        width: 600px;
        border: 1px;
        border-radius: 12px;
        border-color: @border-color;
        background-color: @background;
      }

      mainbox {
        spacing: 10px;
        padding: 20px;
        children: [ "inputbar", "message", "listview" ];
      }

      inputbar {
        spacing: 10px;
        padding: 10px;
        border-radius: 12px;
        background-color: @background-alt;
        text-color: @foreground;
        children: [ "entry" ];
      }

      entry {
        placeholder: "Search...";
      }

      listview {
        columns: 1;
        lines: 6;
        spacing: 10px;
        layout: vertical;
      }

      element {
        padding: 10px;
        border-radius: 12px;
      }

      element selected.normal {
        background-color: @selected-background;
        text-color: @selected-foreground;
      }

      element-text {
        vertical-align: 0.5;
      }
    '';
  };
}
