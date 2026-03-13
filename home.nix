{ inputs, config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nix-dots/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;

  configs = {
    alacritty = "alacritty";
    btop = "btop";
    fastfetch = "fastfetch";
    hypr = "hypr";
    kitty = "kitty";
    nvim = "nvim";
    swaync = "swaync";
    swayosd = "swayosd";
    waybar = "waybar";
    zen0x = "zen0x";
  };
in

{
  imports = [
    ./modules/hyprland.nix
  ];
  home.username = "aman";
  home.homeDirectory = "/home/aman";
  home.sessionPath = [ "$HOME/.local/bin" ];
  programs.git = {
    enable = true;
    settings.user.name = " zen0x";
    settings.user.email = "amanchaitany@proton.me";
  };
  programs.starship.enable = true;
  programs.zoxide.enable = true;
  programs.fzf.enable = true;
  programs.zsh.enable = true;
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
