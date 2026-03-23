{ config, pkgs, ... }:
{
  # Imports
  imports = [
    ./hardware-configuration.nix
  ];

  # System
  system.stateVersion = "25.11";
  networking.hostName = "bit";
  time.timeZone = "Asia/Kolkata";

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Hardware
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.nvidia = {
    open = true;
  };

  # Networking
  networking.networkmanager.enable = true;

  # Users
  users.users.aman = {
    isNormalUser = true;
    description = "aman";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
  };
  users.defaultUserShell = pkgs.zsh;

  # Nixpkgs
  nixpkgs.config.allowUnfree = true;

  # Programs
  programs.direnv.enable = true;
  programs.firefox.enable = true;
  programs.gamescope = {
    enable = true;
    package = pkgs.gamescope;
  };
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  programs.nix-ld.enable = true;
  programs.steam = {
    enable = true;
    gamescopeSession.enable = false;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.zsh.enable = true;

  # Environment
  environment.systemPackages = with pkgs; [
    git
    nixfmt
    openssh
    vim
    wget
  ];
  environment.shells = with pkgs; [ zsh ];

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Services
  services.displayManager.sddm.enable = true;
  services.openssh = {
    enable = true;
  };
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.options = "terminate:ctrl_alt_bksp";
    videoDrivers = [ "nvidia" ];
  };

  # XDG Portal
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
