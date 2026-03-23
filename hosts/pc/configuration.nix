{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "byte";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kolkata";
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
  programs.firefox.enable = true;
  services.displayManager.ly.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  programs.nix-ld.enable = true;
  programs.direnv.enable = true;
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    openssh
    kitty
    nixfmt
  ];
  environment.shells = with pkgs; [ zsh ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  services.openssh = {
    enable = true;
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.nvidia = {
    open = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  # Gaming
  programs.steam = {
    enable = true;
    gamescopeSession.enable = false;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  programs.gamescope = {
    enable = true;
    package = pkgs.gamescope;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  system.stateVersion = "25.11";
}
