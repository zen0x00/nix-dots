# Bin files configuration
{ config, ... }:

{
  # Symlink bin files to ~/.local/bin
  home.file = {
    ".local/bin/zen0x-apply-generated-theme".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-apply-generated-theme";
    ".local/bin/zen0x-launch-audio".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-launch-audio";
    ".local/bin/zen0x-launch-bluetooth".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-launch-bluetooth";
    ".local/bin/zen0x-launch-browser".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-launch-browser";
    ".local/bin/zen0x-launch-or-focus".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-launch-or-focus";
    ".local/bin/zen0x-launch-or-focus-tui".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-launch-or-focus-tui";
    ".local/bin/zen0x-launch-tui".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-launch-tui";
    ".local/bin/zen0x-launch-wifi".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-launch-wifi";
    ".local/bin/zen0x-theme-generate".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-theme-generate";
    ".local/bin/zen0x-theme-gtk".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-theme-gtk";
    ".local/bin/zen0x-theme-nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-theme-nvim";
    ".local/bin/zen0x-theme-reload".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-theme-reload";
    ".local/bin/zen0x-theme-set-vscode".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-theme-set-vscode";
    ".local/bin/zen0x-theme-wallpaper".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-dots/bin/zen0x-theme-wallpaper";
  };

}
