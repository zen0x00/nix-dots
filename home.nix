
{ inputs, config, pkgs, ... }:

{
  imports = [
    ./modules/hyprland.nix
  ];
  home.username = "aman";
  home.homeDirectory = "/home/aman";
  programs.git = {
    enable = true;
    settings.user.name = " zen0x";
    settings.user.email = "amanchaitany@proton.me";
  };
  programs.walker = {
    runAsService = true; # Note: this option isn't supported in the NixOS module only in the home-manager module
  };
  programs.waybar.enable = true;
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  services.swayosd.enable = true;
  home.packages = with pkgs; [
    alacritty
    ani-cli
    bat
    blender
    bluetui
    btop
    brightnessctl
    cliphist
    cmake
    curl
    dotnet-sdk_11
    fastfetch
    fd
    ffmpeg
    fzf
    git
    git-lfs
    go
    gzip
    imagemagick
    jq
    kitty
    lldb
    localsend
    mako
    mangohud
    mono
    nautilus
    neovim
    ninja
    nixpkgs-fmt
    nwg-look
    obs-studio
    oh-my-posh
    openrgb
    pavucontrol
    playerctl
    ripgrep
    rsync
    ruby
    sassc
    satty
    spotify
    starship
    swaynotificationcenter
    swayosd
    unityhub
    unzip
    vesktop
    vscode
    waybar
    wget
    wine
    winetricks
    wl-clipboard
    wlogout
    yad
    yazi
    zip
    zoxide
    zsh
  ];

  programs.home-manager.enable = true;

  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    settings = {
      include = "current-theme.conf";
      font_size = 14;
      cursor_trail = 5;
      scrollback_indicator_opacity = 0;
      window_padding_width = 20;
      placement_strategy = "top-left";
      hide_window_decorations = "yes";
      resize_debounce_time = "0 0";
      confirm_os_window_close = 0;
      background_opacity = 0.8;
      background_blur = 0;
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      "map shift+cmd+plus" = "change_font_size all +2.0";
      "map shift+cmd+minus" = "change_font_size all -2.0";
      "map shift+cmd+backspace" = "change_font_size all 14";
    };
    font = {
      size = 14;
      name = "JetBrains Mono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
    };
  };

  home.stateVersion = "25.11";
}
