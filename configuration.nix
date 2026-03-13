{ config, pkgs, ... }:
{
imports =
  [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "bit";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kolkata";

  services.xserver = {
    enable = true;
    autoRepeatInterval = 35;
    autoRepeatDelay = 200;
  };

  services.displayManager.ly.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  programs.direnv.enable = true;
  environment.systemPackages = with pkgs; [
    bluez
    gnome-keyring
    libsecret
    networkmanager
    ntfs3g
    openssh
    p7zip
    pipewire
    vulkan-loader
    wireplumber
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth.enable = true;
  programs.zsh.enable = true;
  users.users.aman.shell = pkgs.zsh;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  users.users.aman = {
    isNormalUser = true;
    description = "aman";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  nixpkgs.config.allowUnfree = true;
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;
  programs.nix-ld.enable = true;
  system.stateVersion = "25.11";
}
