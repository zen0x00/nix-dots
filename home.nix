{ config, pkgs, ... }:

{
  home.username = "zen0x";
  home.homeDirectory = "/home/zen0x";
  programs.git = {
    enable = true;
    settings.user.name = " zen0x";
    settings.user.email = "amanchaitany@proton.me";
  };
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo I use nix, btw";
    };
  };
  home.packages = with pkgs; [
    alacritty
    ani-cli
    bat
    bc
    blender
    bluetui
    btop
    brightnessctl
    cliphist
    cmake
    curl
    dotnetCorePackages.sdk_9_0_1xx
    fastfetch
    fd
    ffmpeg
    fzf
    gcc
    gdb
    git
    git-lfs
    go
    gzip
    imagemagick
    jq
    lldb
    localsend
    mako
    mangohud
    mono
    nautilus
    neovim
    ninja
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
  ];
  home.file.".local/bin".source = ./bin;
  home.file.".config/hypr".source = ./hypr;
  home.file.".config/alacritty".source = ./alacritty;
  wayland.windowManager.hyprland.systemd.enable = false;
  home.stateVersion = "25.11";
}
