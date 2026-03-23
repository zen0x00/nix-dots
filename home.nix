{ config, pkgs, ... }:

{
  imports = [
    ./modules/bin.nix
    ./modules/hyprland.nix
    ./modules/kitty.nix
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
}
