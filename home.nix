{ inputs, config, pkgs, lib, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nix-dots/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs =
  lib.filterAttrs
    (name: _: builtins.pathExists "${dotfiles}/${name}")
    {
      alacritty = "alacritty";
      btop = "btop";
      fastfetch = "fastfetch";
      hypr = "hypr";
      kitty = "kitty";
      nvim = "nvim";
      swaync = "swaync";
      swayosd = "swayosd";
      walker = "walker";
      waybar = "waybar";
      zen0x = "zen0x";
    };
in

{
  imports = [inputs.walker.homeManagerModules.default];
  home.username = "aman";
  home.homeDirectory = "/home/aman";
  home.sessionPath = [ "$HOME/.local/bin" ];
  programs.git = {
    enable = true;
    settings.user.name = " zen0x";
    settings.user.email = "amanchaitany@proton.me";
  };
  programs.kitty.enable = true;
  programs.walker = {
    enable = true;
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

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    systemd.enable = false;
  };

  xdg.configFile = builtins.mapAttrs
      (name: subpath: {
        source = create_symlink "${dotfiles}/${subpath}";
        recursive = true;
      })
      configs;

    home.file.".local/bin" = {
      source = create_symlink "${dotfiles}/bin";
      recursive = true;
    };
    home.file.".zshrc" = {
      source = create_symlink "${dotfiles}/zsh/.zshrc";
    };

  home.stateVersion = "25.11";
}
