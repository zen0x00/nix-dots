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

  services.getty.autologinUser = "aman";
  zramSwap.enable = true;
  programs.hyprland.enable = true;
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";

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
    wireplumber.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
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

  # NVIDIA
  services.xserver.videoDrivers = ["nvidia"];
  hardware.cpu.intel.updateMicrocode = true;
  hardware.enableAllFirmware = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };
  hardware.opentabletdriver = {
    enable = false;
  };
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  # OpenRGB
  services.hardware.openrgb.enable = true; 
  services.hardware.openrgb.motherboard = "amd";

  hardware.bluetooth.enable = true;
  programs.zsh.enable = true;
  users.users.aman.shell = pkgs.zsh;
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

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Nix settings
  nix.settings.auto-optimise-store = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
