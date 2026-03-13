{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    elephant.url = "github:abenz1267/elephant";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, hyprland, ... }@inputs: 
    let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };

  in
  {
    nixosConfigurations.nix-btw = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit pkgs-unstable;
      };

      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager

        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.aman = import ./home.nix;
            extraSpecialArgs = { inherit inputs; };
            backupFileExtension = "bak";
          };
        }
      ];
    };
  };
}
