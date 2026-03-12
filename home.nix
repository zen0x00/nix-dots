{ inputs, config, pkgs, ... }:

{
  imports = [inputs.walker.homeManagerModules.default];
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
  programs.walker.enable = true;
  programs.zsh = {
    enable = true;

    shellAliases = {
      ls = "colorls";
      vim = "nvim";
      c = "clear";
    };

    initContent = ''
      fastfetch

      HISTSIZE=50000
      HISTFILE=~/.zsh_history
      SAVEHIST=50000
      HISTDUP=erase

      setopt appendhistory
      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_ignore_dups

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

      ZSH_HIGHLIGHT_STYLES[command]="fg=#f38ba8"
      ZSH_HIGHLIGHT_STYLES[builtin]="fg=#f38ba8"
      ZSH_HIGHLIGHT_STYLES[function]="fg=#f38ba8"
      ZSH_HIGHLIGHT_STYLES[path]="fg=#d4d9eb"
      ZSH_HIGHLIGHT_STYLES[arg]="fg=#d4d9eb"
      ZSH_HIGHLIGHT_STYLES[commandseparator]="fg=#d4d9eb"
      ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=#ff6b6b,bold"
      ZSH_HIGHLIGHT_STYLES[error]="fg=#ff6b6b,bold"
      ZSH_HIGHLIGHT_STYLES[quoted]="fg=#ffd16d"
      ZSH_HIGHLIGHT_STYLES[string]="fg=#ffd16d"
      ZSH_HIGHLIGHT_STYLES[comment]="fg=#8f929e"

      for map in emacs viins vicmd; do
        bindkey -M $map '^[[3~' delete-char
      done

      eval "$(fzf --zsh)"
      eval "$(zoxide init --cmd cd zsh)"
      eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/current.omp.json)"

      bindkey '^[b' backward-word
      bindkey '^[f' forward-word
    '';
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
    zsh
  ];
  home.file.".local/bin".source = ./bin;
  home.file.".config/hypr".source = ./hypr;
  home.file.".config/alacritty".source = ./alacritty;
  home.file.".config/uwsm".source = ./uwsm;
  wayland.windowManager.hyprland.enable = true; 
  wayland.windowManager.hyprland.systemd.enable = false;
  home.stateVersion = "25.11";
}
