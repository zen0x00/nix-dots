{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -l";
      edit = "sudo -e";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixdots#bit";
      vim = "nvim";
      c = "clear";
      update = "sudo nix flake update";
      rebuild-bit = "sudo nixos-rebuild switch --flake ~/nix-dots#bit";
      rebuild-byte = "sudo nixos-rebuild switch --flake ~/nix-dots#byte";
    };

    history = {
      size = 50000;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      path = "${config.home.homeDirectory}/.zsh_history";
    };

    # Add fastfetch here
    initContent = ''
      fastfetch
    '';
  };

  # Ensure fastfetch is installed
  home.packages = with pkgs; [
    fastfetch
  ];
}
