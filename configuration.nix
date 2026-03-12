{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "nix-btw";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };
  services.xserver = {
    enable = true;
    autoRepeatInterval = 35;
    autoRepeatDelay = 200;
  };
  services.displayManager.ly.enable = true;
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
  programs.direnv.enable = true;
  environment.systemPackages = with pkgs; [
    bluez
    bridge-utils
    dnsmasq
    gnome-keyring
    gvfs
    irqbalance
    libsecret
    networkmanager
    ntfs3g
    openssh
    os-prober
    p7zip
    pipewire
    qemu_full
    vde2
    virt-manager
    virt-viewer
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

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  users.users.zen0x = {
    isNormalUser = true;
    description = "zen0x";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
  nixpkgs.config.allowUnfree = true;
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = true;
  programs.nix-ld.enable = true;
  system.stateVersion = "25.11";
}
